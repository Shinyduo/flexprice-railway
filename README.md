# FlexPrice on Railway

Open-source usage-based pricing and billing platform — real-time metering, subscriptions, credits, and invoicing for SaaS.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/flexprice)

## Services

- **FlexPrice API** — main application server (port 8080)
- **FlexPrice Consumer** — event processing consumer
- **FlexPrice Worker** — Temporal workflow worker
- **PostgreSQL 17** — billing data and user management
- **ClickHouse** — usage metering and analytics
- **Kafka** — event streaming for real-time usage ingestion
- **Temporal** — workflow orchestration for billing jobs

## Environment Variables

| Variable | Description |
|----------|-------------|
| `FLEXPRICE_DEPLOYMENT_MODE` | Service mode: `api`, `consumer`, or `temporal_worker` |
| `FLEXPRICE_POSTGRES_HOST` | PostgreSQL host |
| `FLEXPRICE_POSTGRES_PASSWORD` | PostgreSQL password |
| `FLEXPRICE_KAFKA_BROKERS` | Kafka broker address |
| `FLEXPRICE_CLICKHOUSE_ADDRESS` | ClickHouse address |
| `FLEXPRICE_TEMPORAL_ADDRESS` | Temporal server address |
| `FLEXPRICE_AUTH_SECRET` | JWT/auth secret |
| `FLEXPRICE_ENCRYPTION_KEY` | 32-byte hex encryption key |

## How to use

1. Click the Deploy on Railway button above
2. Railway provisions PostgreSQL, ClickHouse, Kafka, and Temporal automatically
3. Access the FlexPrice API at your generated domain
4. Use the pre-configured API key or set up your own auth provider

## Notes

- Built in Go for high-performance event processing
- Supports API key and Supabase authentication modes
- Temporal workflows handle invoicing, renewals, and billing jobs
- Licensed under Elastic License 2.0
