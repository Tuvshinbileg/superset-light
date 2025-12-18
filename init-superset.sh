#!/bin/bash

set -e

# Өгөгдлийн санг инициализ хийх
superset db upgrade

# Админ хэрэглэгч үүсгэх
superset fab create-admin \
    --username "${ADMIN_USERNAME:-admin}" \
    --firstname "${ADMIN_FIRSTNAME:-Admin}" \
    --lastname "${ADMIN_LASTNAME:-User}" \
    --email "${ADMIN_EMAIL:-admin@superset.com}" \
    --password "${ADMIN_PASSWORD:-admin}"

# Superset-ийн үндсэн roles үүсгэх
superset init

# Вэб серверийг эхлүүлэх
gunicorn \
    --bind "0.0.0.0:${PORT:-8088}" \
    --workers 4 \
    --worker-class gthread \
    --threads 2 \
    --timeout 300 \
    --limit-request-line 0 \
    --limit-request-field_size 0 \
    "superset.app:create_app()"
