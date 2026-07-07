# Prompt: Generate Code

Generate implementation from READY stories only.

## Inputs
- Story files (only filenames containing READY)
- slug
- source PR metadata
- config.yml

## Requirements
- Preserve traceability: STORY-* -> SRC-*
- Follow language/framework/build tool from config
- For java + spring-webflux defaults:
  - Java 21
  - Spring Boot 3.x reactive style
  - Gradle
- Add tests:
  - unit tests in src/test/** with meaningful assertions for business logic and error paths
  - integration tests in src/integrationTest/** that call real HTTP endpoints and verify status/payload behavior
- Implement full production-ready API code for selected READY stories (controller, service, data/repository, request/response models, validation, error handling)
- Do not generate placeholder or smoke-test code (no TODO-only files, no `assertTrue(true)`, no dummy endpoints)
- honor package base from config.packages.basePackage
- include changes list and skipped reasons