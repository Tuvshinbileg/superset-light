FROM apache/superset:5.0.0

USER root


# PostgreSQL драйвер нэмж суулгах

RUN python3 -m ensurepip --upgrade

# Install DB drivers into system site-packages
RUN python3 -m pip install --no-cache-dir psycopg2-binary redis

# Superset тохиргоо хийх

COPY superset_config.py /app/pythonpath/superset_config.py



# Өгөгдлийн сангийн инициализ хийх скрипт

COPY init-superset.sh /app/init-superset.sh

RUN chmod +x /app/init-superset.sh


USER superset


# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
