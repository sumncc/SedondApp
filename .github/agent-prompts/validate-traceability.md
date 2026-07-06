# Prompt: Validate Traceability

Validate chain:
REQ -> HLD -> LLD -> Story -> SRC -> releaseNote

## Inputs
- changed docs/generated files
- all generated artifacts
- config.yml

## Requirements
- Fail if any link is missing
- report broken links with file and ID
- emit markdown summary table
- do not silently pass