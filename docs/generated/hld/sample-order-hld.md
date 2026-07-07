# High Level Design: sample-order

Traceability: REQ-SAMPLE-ORDER-001 -> HLD-SAMPLE-ORDER-001

```mermaid
flowchart LR
  User --> OrderService
  OrderService --> OrderDB