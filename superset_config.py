import os

# Flask тохиргоо
SECRET_KEY = os.environ.get('SECRET_KEY', 'CHANGE_ME_TO_A_COMPLEX_RANDOM_SECRET')

# Өгөгдлийн сангийн холболт (PostgreSQL)
SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')

# Redis cache тохиргоо (сонголттой)
CACHE_CONFIG = {
    'CACHE_TYPE': 'RedisCache',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_URL': os.environ.get('REDIS_URL', 'redis://localhost:6379/0')
}

# Хостын тохиргоо
ENABLE_PROXY_FIX = True

# CORS тохиргоо
ENABLE_CORS = True
CORS_OPTIONS = {
    'supports_credentials': True,
    'allow_headers': ['*'],
    'resources': ['*'],
    'origins': ['*']
}

# WebSocket тохиргоо
WTF_CSRF_ENABLED = False
WTF_CSRF_EXEMPT_LIST = []
WTF_CSRF_TIME_LIMIT = None

# Тоон ачааллын тохиргоо
SUPERSET_WEBSERVER_TIMEOUT = 300
