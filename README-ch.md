# Jaffle Shop ClickHouse

## TODO
- [ ] Add CH cloud instructions
- [ ] review features to include
- [ ] Complete slides with instructions and examples.

## Prerequisites
- Python version between 3.9 to 3.12 (>=3.11 recommended)
- Access to a ClickHouse cluster. For example:
    - A cloud cluster (using ClickHouse Cloud)
    - A local cluster (using docker)

## Setup instructions

### Installing dbt

Create a local Python environment and activate it:

```bash
python -m venv .venv
source .venv/bin/activate
```

Install dbt and dbt-clickhouse locally:

```bash
pip install dbt-core dbt-clickhouse
```

Install dbt-dependencies
```bash
dbt deps
```

### Configuring a ClickHouse cluster

#### Local cluster (using docker)

Start a local ClickHouse cluster locally by using docker:

```bash
./clickhouse-docker/start_ch_cluster.sh
```

Rename `profiles-local.yml` to `profiles.yml`. It should work without more changes.

And test dbt can connect to ch:

```bash
dbt debug
```

You can later stop the cluster by using:

```bash
./clickhouse-docker/stop_ch_cluster.sh
```

#### Cloud cluster (using ClickHouse Cloud)

Rename `profiles-cloud.yml` to `profiles.yml`.It should work without more changes.

Set the environment variables:

```bash
export DBT_SCHEMA="jaffle_shop"
export DBT_HOST="my_cluster.my_region.clickhouse.com"
export DBT_USER="default"
export DBT_PASSWORD="my_password"
```

And test dbt can connect to ch:

```bash
dbt debug
```

### Build the project

```bash
dbt build


