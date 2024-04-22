#!/bin/bash
# Exit script on any error
set -e

# Execute dbt run
echo    "Executing dbt run"
dbt run --profiles-dir /root --project-dir /dbt

# Execute dbt elementary
echo    "Executing dbt elementary"
dbt run --select elementary --profiles-dir /root --project-dir /dbt

# Execute dbt test
echo    "Executing dbt test"
dbt test --profiles-dir /root --project-dir /dbt || echo "Tests failed, but continuing to generate docs."

# Generate dbt docs
echo "Generating dbt docs..."
dbt docs generate --profiles-dir /root --project-dir /dbt

# generate elementary report
echo    "elementary edr report starts"
edr report --project-dir /dbt --profiles-dir /root
# edr monitor --slack-webhook https://hooks.slack.com/services/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 --project-dir /dbt --profiles-dir /root

# Start dbt docs in the background on the default port (usually 8080)
dbt docs serve --project-dir /dbt --profiles-dir /root --port 8080 &

# start a local server and expose the below folder to outside container on port 8081
cd /dbt/edr_target
python3 -m http.server 8081