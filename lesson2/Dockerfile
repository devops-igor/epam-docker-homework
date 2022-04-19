# pull official base image
FROM python:3.8-bullseye
# set work directory
WORKDIR /usr/src/app
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# install dependencies
RUN pip install --upgrade pip
COPY ./lib_catalog/requirements.txt .
RUN pip install -r requirements.txt
# copy project
COPY ./lib_catalog .
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
