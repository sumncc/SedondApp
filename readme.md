## How to use the Agentic SDLC System

### 1. Prerequisites
- GitHub Actions enabled
- Branch `develop` exists
- Permissions for workflow to push branches and create PRs
- Python 3.11 (for local script use)
- Bash shell
- Java 21 + Gradle (default stack)

### 2. Quickstart checklist
- Run service: `./gradlew bootRun` (if Spring Boot project is present)
- Run JUnit tests: `./gradlew test`
- Run integration tests: `./gradlew integrationTest`

### 3. Folder structure and stage mapping
- `docs/generated/requirements/**` -> generate `docs/generated/hld/**`
- `docs/generated/hld/**` -> generate `docs/generated/lld/**`
- `docs/generated/lld/**` -> generate `docs/generated/stories/**`
- `docs/generated/stories/**` (READY only) -> generate `src/**`
- `src/**` -> generate `releaseNote/**`
- `releaseNote/**` -> deploy sandbox

### 4. How to start from requirements
1. Add/update files under `docs/generated/requirements/`
2. Open PR to `develop`
3. Merge PR
4. Workflow auto-generates HLD and opens next PR

### 5. How PR merge to `develop` triggers next stage
Workflows listen to:
- `pull_request` with `types: [closed]`
- gated by:
    - `github.event.pull_request.merged == true`
    - `github.event.pull_request.base.ref == 'develop'`

### 6. Manual run instructions
Use **Actions > workflow_dispatch** and pass:
- `slug`
- `input_path`
- optional `target_branch`
- optional `config_path`
- optional `prompt_path`

Local script examples:
```bash
chmod +x .github/scripts/*
.github/scripts/generate_hld docs/generated/requirements sample-order 123 feature/x docs/generated/hld .github/agent-prompts/config.yml .github/agent-prompts/generate_hld.md
.github/scripts/validate_traceability . traceability-report.md
```

### 7. Traceability validation steps
- Run workflow `Agentic SDLC - Traceability Validation`
- Or run local script:
```bash
.github/scripts/validate_traceability . traceability-report.md
```
- Must maintain chain: `REQ -> HLD -> LLD -> Story -> SRC -> releaseNote`

### 8. How to customise prompts
Edit files in `.github/agent-prompts/*.md`.
No workflow/script should hardcode stage instructions.

### 9. How to change configuration
Edit `.github/agent-prompts/config.yml`:
- Java -> .NET: `project.language`
- Mermaid -> PlantUML: `documentation.diagramFormat`
- WebFlux -> another framework: `framework.programmingModel`
- Gradle -> Maven: `framework.buildTool`
- JUnit/Mockito -> alternatives: `testing.*`

### 10. Troubleshooting
- **Permissions errors:** verify workflow `contents: write`, `pull-requests: write`
- **Loop prevention:** bot author check, `auto/<stage>/<slug>` branching, concurrency keys
- **Missing traceability IDs:** run traceability workflow and inspect PR comment report
- **Failed tests:** verify project has build files and test tasks configured
- **Failed PR creation:** ensure branch protections allow workflow-created branches/PRs

### 11. Example end-to-end flow (slug: `sample-order`)
1. Merge requirements PR to `develop`
2. Auto PR: `docs: hld sample-order`
3. Merge -> Auto PR: `docs: lld sample-order`
4. Merge -> Auto PR: `docs: stories sample-order`
5. Rename selected story files to include `READY` in the filename (only those files trigger code generation)
6. Merge -> Auto PR: `feat: sample-order`
7. Merge -> Auto PR: `docs: release note sample-order`
8. Merge -> sandbox deploy workflow runs