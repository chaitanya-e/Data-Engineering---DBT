# Use dbt's official PostgreSQL image as the base
FROM ghcr.io/dbt-labs/dbt-postgres:1.5.8

# Set the working directory inside the container
WORKDIR /dbt

# Copy the entrypoint script into the container and make it executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port 8080 for dbt docs serve
EXPOSE 8080

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Default command if no other command is specified when the container is run
CMD ["dbt", "--version"]  # This can be changed to any dbt command you commonly use