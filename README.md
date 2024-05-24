# Data-Engineering

This project performs the below activities
1. loads init.sql into source postgres
2. invokes etl_script.py to pg_copy - dump.sql file on source postgres
3. loads dump.sql to destination postgres with psql
4. invokes custom_postgres dbt models on destination postgres
5. performs custom_postgres dbt tests on destination postgres
6. generates dbt docs and serves them on port 8080
7. uses elementary to beautify the tests and serves them on port 8081

