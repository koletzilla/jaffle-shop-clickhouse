cd "$(dirname "$0")"
export DBT_CH_TEST_CH_VERSION=25.8
docker compose -f docker-compose.yml up -d