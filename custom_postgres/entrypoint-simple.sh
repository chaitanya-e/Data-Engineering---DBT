#!/bin/bash
# Exit script on any error
set -e

# Execute dbt run
echo    "Executing dbt run"
dbt run --profiles-dir /root --project-dir /dbt

# Execute dbt test
echo    "Executing dbt test"
dbt test --profiles-dir /root --project-dir /dbt || echo "Tests failed, but continuing to generate docs."

# Generate dbt docs
echo "Generating dbt docs..."
dbt docs generate --profiles-dir /root --project-dir /dbt

# Serve dbt docs
# This will start a server, it should be the last command unless you run it in the background
echo "Serving dbt docs on port 8080..."
dbt docs serve --profiles-dir /root --project-dir /dbt --port 8080

# Keep the container running
tail -f /dev/null