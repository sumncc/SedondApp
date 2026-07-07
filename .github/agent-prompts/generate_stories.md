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
- Generated filenames must not include READY; users select stories by renaming chosen files to include READY for the next stage
- Preserve traceability IDs: LLD-* -> STORY-*
- Must cover:
  - API/programming (create one API story for each endpoint listed in LLD API contracts)
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