#!/bin/bash

echo "Enter a single word to prefix your project name and API app name:"
read -p "> " PROJECT_NAME

mkdir ${PROJECT_NAME} && cd $_

echo "Enter the SSH address for your Github repository:"
read -p "> " REPO_NAME

curl -L -s 'https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore' > .gitignore
echo 'db.sqlite3' >> .gitignore
pipenv install django autopep8 pylint djangorestframework django-cors-headers pylint-django
pipenv run django-admin startproject ${PROJECT_NAME}project .
pipenv run python3 manage.py startapp ${PROJECT_NAME}api
touch ./db.sqlite3
touch ./seed_database.sh
mkdir -p ./.vscode
mkdir -p ./${PROJECT_NAME}api/fixtures
touch ./${PROJECT_NAME}api/fixtures/users.json
touch ./${PROJECT_NAME}api/fixtures/tokens.json
mkdir -p ./${PROJECT_NAME}api/models
touch ./${PROJECT_NAME}api/models/__init__.py
mkdir -p ./${PROJECT_NAME}api/views
touch ./${PROJECT_NAME}api/views/__init__.py
touch ./${PROJECT_NAME}api/views/auth.py
touch ./${PROJECT_NAME}api/views/template.py
rm ./${PROJECT_NAME}api/views.py
rm ./${PROJECT_NAME}api/models.py

cat <<EOL > ./${PROJECT_NAME}api/fixtures/users.json
[
    {
      "model": "auth.user",
      "pk": 1,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$skKMaZQjJwGMIJO1MmeaoP\$68b2U4VFPL1ZQYgYmM7sIJUWPDhKCrAJOrdz4MWnLq4=",
        "last_login": null,
        "is_superuser": false,
        "username": "ryan@ryantanay.com",
        "first_name": "Ryan",
        "last_name": "Tanay",
        "email": "ryan@ryantanay.com",
        "is_staff": false,
        "is_active": true,
        "date_joined": "2022-10-21T21:15:55.764Z",
        "groups": [],
        "user_permissions": []
      }
    },
    {
      "model": "auth.user",
      "pk": 2,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$6caQGznxTT5xOWckvjT6QO\$YZTdqhVzw5XIXUcA2TrQsZuC4SJGBeFc2OYOIz6j8Lk=",
        "last_login": null,
        "is_superuser": false,
        "username": "meg@ducharme.com",
        "first_name": "Meg",
        "last_name": "Ducharme",
        "email": "meg@ducharme.com",
        "is_staff": true,
        "is_active": true,
        "date_joined": "2022-10-21T21:16:33.812Z",
        "groups": [],
        "user_permissions": []
      }
    },
    {
      "model": "auth.user",
      "pk": 3,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$NKseENHvY06F1AIu2RdtPX\$mEuwkQRhvscNYW9ORA68BddrY96oVevnyLz6szhmrO4=",
        "last_login": null,
        "is_superuser": false,
        "username": "jenna@solis.com",
        "first_name": "Jenna",
        "last_name": "Solis",
        "email": "jenna@solis.com",
        "is_staff": false,
        "is_active": true,
        "date_joined": "2022-10-21T21:17:24.322Z",
        "groups": [],
        "user_permissions": []
      }
    },
    {
      "model": "auth.user",
      "pk": 4,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$d3OTZFUe5DZje6Kb6rm7zv\$5oKmFOAQ2WtJQJ+FCT4tXnkbsL60zQN0OTM4nPQQ69A=",
        "last_login": null,
        "is_superuser": false,
        "username": "bryan@nilson.com",
        "first_name": "Bryan",
        "last_name": "Nilson",
        "email": "bryan@nilson.com",
        "is_staff": false,
        "is_active": true,
        "date_joined": "2022-10-21T21:18:12.946Z",
        "groups": [],
        "user_permissions": []
      }
    },
    {
      "model": "auth.user",
      "pk": 5,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$L9WyeeE95squbRZelePsZf\$XayBzPujv5CeAnmIzcLL0orBqE3qDpJLuQsy9zOM5rc=",
        "last_login": null,
        "is_superuser": false,
        "username": "emily@lemmon.com",
        "first_name": "Emily",
        "last_name": "Lemmon",
        "email": "emily@lemmon.com",
        "is_staff": true,
        "is_active": true,
        "date_joined": "2022-10-21T21:18:55.741Z",
        "groups": [],
        "user_permissions": []
      }
    },
    {
      "model": "auth.user",
      "pk": 6,
      "fields": {
        "password": "pbkdf2_sha256\$320000\$iU8LQX1Y1DxUjhddsV7FR7\$AAvT4VAaY7v7hiOGX8/rnuoAkZnj1joW5WOt6kbGC9Q=",
        "last_login": null,
        "is_superuser": false,
        "username": "tyler@hilliard.com",
        "first_name": "Tyler",
        "last_name": "Hilliard",
        "email": "tyler@hilliard.com",
        "is_staff": true,
        "is_active": true,
        "date_joined": "2022-10-21T21:19:24.892Z",
        "groups": [],
        "user_permissions": []
      }
    }
  ]
EOL

cat <<EOL > ./${PROJECT_NAME}api/fixtures/tokens.json
[
  {
    "model": "authtoken.token",
    "pk": "06787add96eb3264080015997720cb0877b40f90",
    "fields": {
      "user": 6,
      "created": "2022-10-21T21:19:25.057Z"
    }
  },
  {
    "model": "authtoken.token",
    "pk": "0be249c88238743e5b4a7ac370b5145730c28e20",
    "fields": {
      "user": 1,
      "created": "2022-10-21T21:15:55.928Z"
    }
  },
  {
    "model": "authtoken.token",
    "pk": "8b44b69d17de6e7e81bede339e8fd997369f8819",
    "fields": {
      "user": 5,
      "created": "2022-10-21T21:18:55.902Z"
    }
  },
  {
    "model": "authtoken.token",
    "pk": "a165c6136019e8c4246c1a31856234d33ce476da",
    "fields": {
      "user": 4,
      "created": "2022-10-21T21:18:13.109Z"
    }
  },
  {
    "model": "authtoken.token",
    "pk": "d74b97fbe905134520bb236b0016703f50380dcf",
    "fields": {
      "user": 2,
      "created": "2022-10-21T21:16:33.976Z"
    }
  },
  {
    "model": "authtoken.token",
    "pk": "ec7ddcc665035a3adeaa80ed8f812bfe3ef5b5f4",
    "fields": {
      "user": 3,
      "created": "2022-10-21T21:17:24.482Z"
    }
  }
]
EOL

cat <<EOL > ./${PROJECT_NAME}api/views/auth.py
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db import IntegrityError
from rest_framework.authtoken.models import Token
from rest_framework import serializers, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'email')

@api_view(['POST'])
@permission_classes([AllowAny])
def login_user(request):
    username = request.data['username']
    password = request.data['password']
    authenticated_user = authenticate(username=username, password=password)
    if authenticated_user is not None:
        token = Token.objects.get(user=authenticated_user)
        data = {
            'valid': True,
            'token': token.key,
            'user_id': authenticated_user.id,
            'username': authenticated_user.username,
            'first_name': authenticated_user.first_name,
            'last_name': authenticated_user.last_name,
            'email': authenticated_user.email
        }
        return Response(data)
    else:
        data = {'valid': False}
        return Response(data)

@api_view(['POST'])
@permission_classes([AllowAny])
def register_user(request):
    try:
        new_user = User.objects.create_user(
            username=request.data['username'],
            password=request.data['password'],
            email=request.data['email'],
            first_name=request.data['first_name'],
            last_name=request.data['last_name']
        )
    except IntegrityError:
        return Response({'message': 'Username already taken'}, status=status.HTTP_400_BAD_REQUEST)

    token = Token.objects.create(user=new_user)
    data = {
        'token': token.key,
        'user_id': new_user.id,
        'username': new_user.username,
        'first_name': new_user.first_name,
        'last_name': new_user.last_name,
        'email': new_user.email
    }
    return Response(data)

@api_view(["GET"])
@permission_classes([AllowAny])
def get_current_user(request):
    """Handle GET requests for single item

    Returns:
        Response -- JSON serialized instance
    """

    try:
        serializer = UserSerializer(request.user)
        return Response(serializer.data)
    except Exception as ex:
        return Response({"reason": ex.args[0]}, status=status.HTTP_400_BAD_REQUEST)
EOL

cat <<EOL > ./${PROJECT_NAME}api/views/template.py
from django.http import HttpResponseServerError
from rest_framework import serializers, status
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from rockapi.models import Void


class TemplateView(ViewSet):
    """Void view set"""


    def create(self, request):
        """Handle POST operations

        Returns:
            Response -- JSON serialized instance
        """
        void = Void()
        void.sample_name = request.data["name"]
        void.sample_description = request.data["description"]

        try:
            void.save()
            serializer = VoidSerializer(void)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as ex:
            return Response({"reason": ex.args[0]}, status=status.HTTP_400_BAD_REQUEST)

    def retrieve(self, request, pk=None):
        """Handle GET requests for single item

        Returns:
            Response -- JSON serialized instance
        """
        try:
            void = Void.objects.get(pk=pk)
            serializer = VoidSerializer(void)
            return Response(serializer.data)
        except Exception as ex:
            return Response({"reason": ex.args[0]}, status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, pk=None):
        """Handle PUT requests

        Returns:
            Response -- Empty body with 204 status code
        """
        try:
            void = Void.objects.get(pk=pk)
            void.sample_name = request.data["name"]
            void.sample_description = request.data["description"]
            void.save()
        except Void.DoesNotExist:
            return Response(None, status=status.HTTP_404_NOT_FOUND)

        except Exception as ex:
            return HttpResponseServerError(ex)

        return Response(None, status=status.HTTP_204_NO_CONTENT)

    def destroy(self, request, pk=None):
        """Handle DELETE requests for a single item

        Returns:
            Response -- 200, 404, or 500 status code
        """
        try:
            void = Void.objects.get(pk=pk)
            void.delete()
            return Response(None, status=status.HTTP_204_NO_CONTENT)

        except Void.DoesNotExist as ex:
            return Response({'message': ex.args[0]}, status=status.HTTP_404_NOT_FOUND)

        except Exception as ex:
            return Response({'message': ex.args[0]}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def list(self, request):
        """Handle GET requests for all items

        Returns:
            Response -- JSON serialized array
        """
        try:
            voids = Void.objects.all()
            serializer = VoidSerializer(voids, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as ex:
            return HttpResponseServerError(ex)


class VoidSerializer(serializers.ModelSerializer):
    """JSON serializer"""

    class Meta:
        model = Void
        fields = ( 'id', 'sample_name', 'sample_description', )

EOL

cat <<EOL > ./${PROJECT_NAME}api/views/__init__.py
from .auth import login_user, register_user, get_current_user

EOL

cat <<EOL > ./.vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Django",
            "type": "python",
            "request": "launch",
            "program": "${workspaceFolder}/manage.py",
            "args": ["runserver"],
            "django": true,
            "autoReload":{
                "enable": true
            }
        }
    ]
}

EOL

cat <<EOL > ./.vscode/settings.json
{
    "pylint.args": [
        "--disable=W0105,E1101,W0614,C0111,C0301",
        "--load-plugins=pylint_django",
        "--django-settings-module=bangazon.settings",
        "--max-line-length=120"
    ],
}

EOL

cat <<EOL > ./${PROJECT_NAME}project/settings.py
from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-x9yg09-pv69(#mz@!n(1&c_rxvks#3*v&#vx!%t39p(n(f0gbb'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'rest_framework.authtoken',
    'corsheaders',
    '${PROJECT_NAME}api',
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    ),
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],
}

CORS_ORIGIN_WHITELIST = (
    'http://localhost:3000',
    'http://127.0.0.1:3000',
    'http://localhost:5173',
    'http://127.0.0.1:5173',
)


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = '${PROJECT_NAME}project.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = '${PROJECT_NAME}project.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

EOL

cat <<EOL > ./${PROJECT_NAME}project/urls.py
from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from ${PROJECT_NAME}api.views import (
    register_user,
    login_user,
    get_current_user,
    )

router = routers.DefaultRouter(trailing_slash=False)

urlpatterns = [
    path('', include(router.urls)),
    path('register', register_user),
    path('login', login_user),
    path('current_user', get_current_user),
]

EOL

cat <<EOL > ./seed_database.sh
#!/bin/bash

rm db.sqlite3
rm -rf ./${PROJECT_NAME}api/migrations
python3 manage.py migrate
python3 manage.py makemigrations ${PROJECT_NAME}api
python3 manage.py migrate ${PROJECT_NAME}api
python3 manage.py loaddata users
python3 manage.py loaddata tokens

EOL

chmod +x ./seed_database.sh

cat <<EOL > ./.pylintrc
[FORMAT]
  good-names=i,j,ex,pk

[MESSAGES CONTROL]
  disable=broad-except,imported-auth-user,missing-class-docstring,no-self-use,abstract-method

[MASTER]
  disable=C0114,
  
EOL

pipenv run python3 manage.py makemigrations
pipenv run python3 manage.py migrate
pipenv run python3 manage.py loaddata ${PROJECT_NAME}api/fixtures/users.json
pipenv run python3 manage.py loaddata ${PROJECT_NAME}api/fixtures/tokens.json

git init
git remote add origin ${REPO_NAME}
git branch -m master main
git add .
git commit -m 'Initial commit'
git push -u origin main
