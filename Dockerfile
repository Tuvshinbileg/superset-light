FROM apache/superset:latest

# Администратор хэрэглэгч үүсгэх
USER root

# PostgreSQL драйвер болон бусад шаардлагатай сангууд суулгах
RUN pip install --no-cache-dir \
    psycopg2-binary \
    redis

# Superset тохиргоо хийх
COPY superset_config.py /app/pythonpath/superset_config.py

# Өгөгдлийн сангийн инициализ хийх скрипт
COPY init-superset.sh /app/init-superset.sh
RUN chmod +x /app/init-superset.sh

USER superset

# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
