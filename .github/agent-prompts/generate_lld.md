# Prompt: Generate LLD

Generate detailed low-level design from HLD.

## Inputs
- Changed HLD files
- slug
- source PR metadata
- config.yml

## Requirements
- Output folder: docs/generated/lld/
- Preserve traceability IDs: HLD-* -> LLD-*
- Include:
  - module-level responsibilities
  - API contracts
  - data models
  - sequence diagrams
  - state/flow diagrams where relevant
- Diagram format must come from config.