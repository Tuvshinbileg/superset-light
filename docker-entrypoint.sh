#!/bin/bash
set -e

superset db upgrade
superset fab create-admin \
  --username $ADMIN_USERNAME \
  --firstname Admin \
  --lastname User \
  --email admin@example.com \
  --password $ADMIN_PASSWORD || true

superset init
superset run -h 0.0.0.0 -p ${PORT:-8088}

