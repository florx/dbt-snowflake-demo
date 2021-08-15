DBT_PARAMS=--profiles-dir dbt-profiles/


all: setup run docs-generate

setup:
	snowsql -f setup.sql

run:
	dbt run $(DBT_PARAMS)

docs-serve:
	dbt docs serve $(DBT_PARAMS)

docs-generate:
	dbt docs generate $(DBT_PARAMS)