FROM apache/superset:latest

USER root

# System dependencies суулгах
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Virtual environment-руу PostgreSQL драйвер суулгах
RUN /app/.venv/bin/pip install --no-cache-dir \
    psycopg2-binary==2.9.9 \
    redis==5.0.1

# Superset тохиргоо хийх
COPY superset_config.py /app/pythonpath/superset_config.py

# Өгөгдлийн сангийн инициализ хийх скрипт
COPY init-superset.sh /app/init-superset.sh
RUN chmod +x /app/init-superset.sh

USER superset

# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
