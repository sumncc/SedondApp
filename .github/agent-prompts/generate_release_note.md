# Prompt: Generate Release Notes

Generate release note from source code changes.

## Inputs
- Changed src files
- slug
- source PR metadata
- config.yml

## Requirements
- Output folder: releaseNote/
- Preserve traceability: SRC-* -> REL-*
- Must include:
  - features added
  - bugs fixed
  - tests added/updated
  - security changes
  - DevOps/config changes
  - breaking changes