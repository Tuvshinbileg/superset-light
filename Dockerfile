FROM apache/superset:5.0.0

USER root

# Always install into the SAME python that Superset uses
RUN python -m pip install --no-cache-dir psycopg2-binary redis

# Superset config
COPY superset_config.py /app/superset_config.py
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

# Init script
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER superset
ENTRYPOINT ["/entrypoint.sh"]

