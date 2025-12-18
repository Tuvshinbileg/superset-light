FROM apache/superset:3.1.1

USER root

# Extra deps (optional)
RUN pip install psycopg2-binary redis

# Superset config
COPY superset_config.py /app/superset_config.py
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

# Init script
COPY ./docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER superset
ENTRYPOINT ["/entrypoint.sh"]

