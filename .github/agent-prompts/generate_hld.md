# Prompt: Generate HLD

You are generating High Level Design from requirements.

## Inputs
- Changed requirements files
- slug
- source PR metadata
- config.yml

## Requirements
- Output folder: docs/generated/hld/
- Preserve traceability IDs: REQ-* -> HLD-*
- Use diagram format from config: documentation.diagramFormat
- Include:
  - System context
  - Container diagram
  - Component diagram
  - Key sequence flow
  - Non-functional requirements mapping
- If diagram format is mermaid, emit fenced mermaid blocks.
- If plantuml, emit fenced plantuml blocks.