# Deploy and Host FlexPrice (Open-Source Usage-Based Billing) on Railway

FlexPrice is an open-source usage-based pricing and billing platform built in Go for SaaS companies. It provides real-time usage metering, subscription management, credits and top-ups, and automated invoicing — giving developers full control over complex billing models without vendor lock-in. A powerful open-source alternative to Stripe Billing, Orb, and Amberflo.

## About Hosting FlexPrice

Self-hosting FlexPrice requires coordinating multiple services: PostgreSQL for billing data, ClickHouse for real-time usage analytics, Kafka for event streaming, and Temporal for workflow orchestration. Each component handles a critical part of the billing pipeline — from ingesting usage events to generating invoices.

With Railway, the entire FlexPrice stack is provisioned automatically. PostgreSQL, ClickHouse, Kafka, and Temporal are deployed and connected with proper networking and persistent storage. You focus on configuring pricing models, not managing infrastructure.

## Common Use Cases

- Usage-based billing with real-time metering for API calls, compute, storage, or data transfer
- SaaS subscription management with flexible plan configurations and automated renewals
- Credit and prepaid balance systems with top-ups and consumption tracking

## Dependencies for FlexPrice Hosting

- PostgreSQL 17 (billing data and user management)
- ClickHouse (real-time usage metering and analytics)
- Kafka (event streaming for usage data ingestion)
- Temporal (workflow orchestration for billing jobs and invoicing)

### Deployment Dependencies

- [FlexPrice GitHub Repository](https://github.com/flexprice/flexprice)
- [FlexPrice Documentation](https://docs.flexprice.io)

### Implementation Details

FlexPrice runs three application services from the same binary, controlled by `FLEXPRICE_DEPLOYMENT_MODE`:

```
FLEXPRICE_DEPLOYMENT_MODE=api              # REST API server (port 8080)
FLEXPRICE_DEPLOYMENT_MODE=consumer         # Kafka event consumer
FLEXPRICE_DEPLOYMENT_MODE=temporal_worker  # Temporal workflow worker
```

Key environment variables:
```
FLEXPRICE_POSTGRES_HOST=${{Postgres.RAILWAY_PRIVATE_DOMAIN}}
FLEXPRICE_KAFKA_BROKERS=${{kafka.RAILWAY_PRIVATE_DOMAIN}}:9092
FLEXPRICE_CLICKHOUSE_ADDRESS=${{clickhouse.RAILWAY_PRIVATE_DOMAIN}}:9000
FLEXPRICE_TEMPORAL_ADDRESS=${{temporal.RAILWAY_PRIVATE_DOMAIN}}:7233
```

## Why Deploy FlexPrice on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying FlexPrice on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.

---

## Template Titles

**Railway Title:** `FlexPrice [Updated May '26]`
**Railway Description:** `FlexPrice [May '26] (Usage-Based Billing, Metering & Invoicing) Self Host`
**Spreadsheet Title:** `FlexPrice (Open-Source Usage-Based Pricing & Billing Platform)`
**GitHub Description:** `FlexPrice — open-source usage-based pricing & billing platform. Deploy on Railway with one click.`
