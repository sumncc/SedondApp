# High Level Design: pr-7

- Traceability: REQ-PR-7-001 -> HLD-PR-7-001
- Source PR: #7
- Source Branch: sumncc-patch-2
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
