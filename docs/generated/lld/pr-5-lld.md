# Low Level Design: pr-5

- Traceability: HLD-PR-5-001 -> LLD-PR-5-001
- Source PR: #5
- Source Branch: auto/hld/pr-4
- Input Paths: docs/generated/hld

## Modules
- controller
- service
- repository
- dto
- mapper

## API Contract
- GET /api/v1/items/{id}
- POST /api/v1/items

## Sequence
```mermaid
sequenceDiagram
  participant C as Controller
  participant S as Service
  participant R as Repository
  C->>S: createItem(dto)
  S->>R: save(entity)
  R-->>S: entity
  S-->>C: responseDto
```
