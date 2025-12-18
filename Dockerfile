FROM apache/superset:latest

# Администратор хэрэглэгч үүсгэх
USER root

# Superset тохиргоо хийх
COPY superset_config.py /app/pythonpath/superset_config.py

# Өгөгдлийн сангийн инициализ хийх скрипт
COPY init-superset.sh /app/init-superset.sh
RUN chmod +x /app/init-superset.sh

USER superset

# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
