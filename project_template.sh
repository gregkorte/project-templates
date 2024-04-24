#!/bin/bash

echo "Enter a single word to prefix your project name and API app name:"
read -p "> " PROJECT_NAME

echo "Enter the SSH address for your Github repository:"
read -p "> " REPO_NAME

curl -L -s 'https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore' > .gitignore
echo 'db.sqlite3' >> .gitignore
pipenv install django autopep8 pylint djangorestframework django-cors-headers pylint-django
django-admin startproject ${PROJECT_NAME}project .
python3 manage.py startapp ${PROJECT_NAME}api
mkdir ./.vscode
mkdir ./${PROJECT_NAME}api/fixtures
touch ./${PROJECT_NAME}api/fixtures/users.json
touch ./${PROJECT_NAME}api/fixtures/tokens.json
mkdir ./${PROJECT_NAME}api/models
touch ./${PROJECT_NAME}api/models/__init__.py
mkdir ./${PROJECT_NAME}api/views
touch ./${PROJECT_NAME}api/views/__init__.py
touch ./${PROJECT_NAME}api/views/auth.py
rm ./${PROJECT_NAME}api/views.py
rm ./${PROJECT_NAME}api/models.py

echo '
[
    {
      "model": "auth.user",
      "pk": 1,
      "fields": {
        "password": "pbkdf2_sha256$320000$skKMaZQjJwGMIJO1MmeaoP$68b2U4VFPL1ZQYgYmM7sIJUWPDhKCrAJOrdz4MWnLq4=",
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
        "password": "pbkdf2_sha256$320000$6caQGznxTT5xOWckvjT6QO$YZTdqhVzw5XIXUcA2TrQsZuC4SJGBeFc2OYOIz6j8Lk=",
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
        "password": "pbkdf2_sha256$320000$NKseENHvY06F1AIu2RdtPX$mEuwkQRhvscNYW9ORA68BddrY96oVevnyLz6szhmrO4=",
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
        "password": "pbkdf2_sha256$320000$d3OTZFUe5DZje6Kb6rm7zv$5oKmFOAQ2WtJQJ+FCT4tXnkbsL60zQN0OTM4nPQQ69A=",
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
        "password": "pbkdf2_sha256$320000$L9WyeeE95squbRZelePsZf$XayBzPujv5CeAnmIzcLL0orBqE3qDpJLuQsy9zOM5rc=",
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
        "password": "pbkdf2_sha256$320000$iU8LQX1Y1DxUjhddsV7FR7$AAvT4VAaY7v7hiOGX8/rnuoAkZnj1joW5WOt6kbGC9Q=",
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
' > ./${PROJECT_NAME}api/fixtures/users.json

echo '
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

' > ./${PROJECT_NAME}api/fixtures/tokens.json

echo '
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db import IntegrityError
from rest_framework.authtoken.models import Token
from rest_framework import serializers, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response


@api_view(["POST"])
@permission_classes([AllowAny])
def login_user(request):
    """Handles the authentication of a user

    Method arguments:
      request -- The full HTTP request object
    """
    email = request.data["email"]
    password = request.data["password"]

    # Use the built-in authenticate method to verify
    # authenticate returns the user object or None if no user is found
    authenticated_user = authenticate(username=email, password=password)

    # If authentication was successful, respond with their token
    if authenticated_user is not None:
        token = Token.objects.get(user=authenticated_user)

        data = {"valid": True, "token": token.key}
        return Response(data)
    else:
        # Bad login details were provided. So we cant log the user in.
        data = {"valid": False}
        return Response(data)


@api_view(["POST"])
@permission_classes([AllowAny])
def register_user(request):
    """Handles the creation of a new user for authentication

    Method arguments:
      request -- The full HTTP request object
    """
    email = request.data.get("email", None)
    first_name = request.data.get("first_name", None)
    last_name = request.data.get("last_name", None)
    password = request.data.get("password", None)

    if (
        email is not None
        and first_name is not None
        and last_name is not None
        and password is not None
    ):

        try:
            # Create a new user by invoking the `create_user` helper method
            # on Djangos built-in User model
            new_user = User.objects.create_user(
                username=request.data["email"],
                email=request.data["email"],
                password=request.data["password"],
                first_name=request.data["first_name"],
                last_name=request.data["last_name"],
            )
        except IntegrityError:
            return Response(
                {"message": "An account with that username already exists"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # Use the REST Frameworks token generator on the new user account
        token = Token.objects.create(user=new_user)
        # Return the token to the client
        data = {"token": token.key}
        return Response(data)

    return Response(
        {"message": "You must provide email, password, first_name, and last_name"},
        status=status.HTTP_400_BAD_REQUEST,
    )


@api_view(["GET"])
@permission_classes([AllowAny])
def get_current_user(request):
    """Handle GET requests for single user

    Returns:
        Response -- JSON serialized instance
    """

    try:
        serializer = UserSerializer(request.user)
        return Response(serializer.data)
    except Exception as ex:
        return Response({"reason": ex.args[0]}, status=status.HTTP_400_BAD_REQUEST)


class UserSerializer(serializers.ModelSerializer):
    """JSON Serializer"""

    firstName = serializers.CharField(source="first_name")
    lastName = serializers.CharField(source="last_name")

    class Meta:
        model = User
        fields = (
            "id",
            "firstName",
            "lastName",
            "username",
        )

' > ./${PROJECT_NAME}api/views/auth.py

echo '
from .auth import login_user, register_user, get_current_user

' > ./${PROJECT_NAME}api/views/__init__.py

echo '{
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
' > ./.vscode/launch.json

echo '{
    "pylint.args": [
        "--disable=W0105,E1101,W0614,C0111,C0301",
        "--load-plugins=pylint_django",
        "--django-settings-module=bangazon.settings",
        "--max-line-length=120"
    ],
}
' > ./.vscode/settings.json

echo "
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
" > ./${PROJECT_NAME}project/settings.py

echo "
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
" > ./${PROJECT_NAME}project/urls.py

echo "#!/bin/bash

rm db.sqlite3
rm -rf ./${PROJECT_NAME}api/migrations
python3 manage.py migrate
python3 manage.py makemigrations ${PROJECT_NAME}api
python3 manage.py migrate ${PROJECT_NAME}api
python3 manage.py loaddata users
python3 manage.py loaddata tokens
" > ./seed_database.sh

chmod +x ./seed_database.sh


echo '[FORMAT]
  good-names=i,j,ex,pk

[MESSAGES CONTROL]
  disable=broad-except,imported-auth-user,missing-class-docstring,no-self-use,abstract-method

[MASTER]
  disable=C0114,
' > .pylintrc

pipenv run bash -c "python3 manage.py migrate"
git init
git add --all
git commit -m "Initial commit"
git branch -M main
git remote add origin ${REPO_NAME}
git push -u origin main

echo "**********************************"
echo ""
echo "Open your Pipfile in the project and make sure that the right version of Python is specified at the bottom"
echo ""
echo "**********************************"