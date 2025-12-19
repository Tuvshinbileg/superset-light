import os

# Flask тохиргоо
SECRET_KEY = os.environ.get('SECRET_KEY', 'CHANGE_ME_TO_A_COMPLEX_RANDOM_SECRET')

# Өгөгдлийн сангийн холболт (PostgreSQL)
database_url = os.environ.get('DATABASE_URL', '')
# Railway-н PostgreSQL URL postgresql:// -ээр эхэлдэг, psycopg2-д зориулж засах
if database_url.startswith('postgres://'):
    database_url = database_url.replace('postgres://', 'postgresql+psycopg2://', 1)
elif database_url.startswith('postgresql://'):
    database_url = database_url.replace('postgresql://', 'postgresql+psycopg2://', 1)

SQLALCHEMY_DATABASE_URI = database_url

FEATURE_FLAGS = {
    "EMBEDDED_SUPERSET": True,
    "DASHBOARD_RBAC": True,
}


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

TALISMAN_ENABLED=True

HTTP_HEADERS = {
    "X-Frame-Options": "ALLOW",
}

CONTENT_SECURITY_POLICY = {
    "default-src": ["'self'", "'unsafe-inline'", "'unsafe-eval'", "data:", "blob:", "*"],
    "img-src": ["'self'", "data:", "blob:", "*"],
    "frame-ancestors": ["'self'", "http://localhost:3000", "http://localhost:3001", "http://localhost:8080"],
}
GUEST_ROLE_NAME="Gamma"
GUEST_TOKEN_JWT_SECRET="superset"
GUEST_TOKEN_JWT_ALGO="HS256A"
GUEST_TOKEN_HEADER_NAME="X-GuestToken"
GUEST_TOKEN_JWT_EXP_SECONDS=300
