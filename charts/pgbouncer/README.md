# PgBouncer

[PgBouncer](https://pgbouncer.github.io/) is a lightweight connection pooler for PostgreSQL.

This chart is inspired by [Clearbit's](https://github.com/clearbit/charts) and adds a number of features:

- Password authentication to PgBouncer itself.
- Probes on PgBouncer.
- Ability to inject custom values into PgBouncer.ini
-   The ability to set the listen backlog, and a higher default.
- Guaranteed quality of service on all pods.
