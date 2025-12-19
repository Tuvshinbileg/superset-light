#FROM apache/superset:3.1.0
FROM apache/superset:5.0.0

USER root

# PostgreSQL драйвер нэмж суулгах
#RUN pip install psycopg2-binary redis

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Superset 5.0.0 нь өөрийн Python environment ашигладаг
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir \
    psycopg2-binary==2.9.9 \
    redis==5.0.1

# Эсвэл pip directly
RUN pip3 install --no-cache-dir \
    psycopg2-binary \
    redis


# Superset тохиргоо хийх
COPY superset_config.py /app/pythonpath/superset_config.py

# Өгөгдлийн сангийн инициализ хийх скрипт
COPY init-superset.sh /app/init-superset.sh
RUN chmod +x /app/init-superset.sh

USER superset
WORKDIR /app

# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
