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
  - unit tests in src/test/**
  - integration tests in src/integrationTest/**
- honor package base from config.packages.basePackage
- include changes list and skipped reasons