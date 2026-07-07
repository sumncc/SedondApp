
```markdown name=docs/generated/lld/sample-order-lld.md
# Low Level Design: sample-order

Traceability: HLD-SAMPLE-ORDER-001 -> LLD-SAMPLE-ORDER-001

```mermaid
sequenceDiagram
  participant API
  participant SVC
  participant DB
  API->>SVC: createOrder
  SVC->>DB: save
  DB-->>SVC: okrvice --> OrderDB