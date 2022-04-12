function Create_Secret_Key () {
Secret_Key=$(python -c "
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())")
}
function setting_local_secret () {
cat <<EOF> /code/project/settings_local.py
SECRET_KEY = '$Secret_Key'
EOF
}

function settigs_local_database () {
cat <<EOF>> /code/project/settings_local.py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': '$POSTGRES_NAME',
        'USER': '$POSTGRES_USER',
        'PASSWORD': '$POSTGRES_PASSWORD',
        'HOST': 'django-backend-db01-001',
        'PORT': 5432,
    }
}
EOF
}

if [ ! -f /code/project/settings_local.py ]; then
    Create_Secret_Key
    setting_local_secret
    settigs_local_database
fi
