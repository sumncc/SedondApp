# High Level Design: pr-4

- Traceability: REQ-PR-4-001 -> HLD-PR-4-001
- Source PR: #4
- Source Branch: sumncc-patch-1
- Input Paths: docs/generated/requirements
- Diagram Format: mermaid

## System Context
```mermaid
flowchart LR
  U[User] --> S[SampleService]
  S --> DB[(Database)]
```

## Container Diagram
```mermaid
flowchart TB
  GW[API Gateway] --> APP[SampleService App]
  APP --> R[(Reactive Repo)]
```

## Component Diagram
```mermaid
flowchart LR
  C[Controller] --> SV[Service]
  SV --> RP[Repository]
```

## Key Sequence
```mermaid
sequenceDiagram
  actor User
  User->>Controller: HTTP request
  Controller->>Service: process()
  Service->>Repository: query()
  Repository-->>Service: data
  Service-->>Controller: response
  Controller-->>User: 200 OK
```
