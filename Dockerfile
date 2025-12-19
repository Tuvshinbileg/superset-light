FROM apache/superset:5.0.0

USER root


# PostgreSQL драйвер нэмж суулгах


RUN python - <<'EOF'
import sys, subprocess
subprocess.check_call([
    sys.executable, "-m", "pip", "install",
    "--no-cache-dir",
    "psycopg2-binary",
    "redis"
])
EOF

# Superset тохиргоо хийх

COPY superset_config.py /app/pythonpath/superset_config.py



# Өгөгдлийн сангийн инициализ хийх скрипт

COPY init-superset.sh /app/init-superset.sh

RUN chmod +x /app/init-superset.sh


USER superset


# Эхлүүлэх командууд
ENTRYPOINT ["/app/init-superset.sh"]
