# pull official base image
FROM python:3.8-slim-bullseye

# label image
LABEL version="1.0.0" maintainer="Igor Skorokhodov <my-email@example.com>"

# add user django
RUN adduser --group --system django
USER django

# set work directory
WORKDIR /home/django/backend

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH="/home/django/.local/bin:${PATH}"

# install dependencies
COPY backend/requirements.txt /tmp
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt

# copy project
COPY backend .
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
