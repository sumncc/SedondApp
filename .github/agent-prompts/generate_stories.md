# Prompt: Generate Stories

Generate JIRA-format stories from LLD.

## Inputs
- Changed LLD files
- slug
- source PR metadata
- config.yml

## Requirements
- Output folder: docs/generated/stories/
- One story per file
- Preserve traceability IDs: LLD-* -> STORY-*
- Must cover:
  - API/programming
  - design
  - DevOps
  - testing
  - security
  - documentation
- Story template:
  - Title
  - Description
  - Acceptance Criteria
  - Technical Notes
  - Test Notes
  - Security Notes
  - DevOps Notes
  - Definition of Done