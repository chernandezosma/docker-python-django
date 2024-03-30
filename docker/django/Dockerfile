FROM python:3.10.14-alpine

RUN apk update && \
    apk --no-interactive --update --no-cache  \
      add  \
          vim  \
          curl  \
          apache2  \
          apache2-utils  \
          apache2-mod-wsgi  \
          py3-pip  \
          py3-virtualenv


RUN ln -sf python3 /usr/bin/python

RUN pip install --upgrade pip setuptools
RUN pip install django pydevd-pycharm

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/var/www/hello
ARG PIP_REQUIREMENTS=dev.txt

# create user for the Django project
RUN addgroup -S pygroup -g 1000
RUN adduser -S pyuser -u 1000 -G pygroup

USER pyuser

RUN export PYTHONPATH=/var/www/hello/src
RUN export PYTHONDONTWRITEBYTECODE=1
ENV export PYTHONUNBUFFERED=1

WORKDIR /var/www/hello
RUN pip install --upgrade pip

# create and activate virtual environment
RUN python3 -m venv env

COPY --chown=pyuser ./src/requirements/. /var/www/hello/requirements/.
COPY --chown=pyuser ./src/manage.py /var/www/hello/.

RUN mkdir -p ./static
RUN mkdir -p ./media
RUN mkdir -p ./logs

RUN pwd
RUN ls -la

RUN python --version

# copy and install pip requirements

RUN ./env/bin/pip3 install --no-cache-dir --force-reinstall -r /var/www/hello/requirements/dev.txt

# copy Django project files
COPY --chown=pyuser ./src/hello hello

USER root
RUN chmod -R 775 hello
RUN chmod -R 775 logs 
RUN chown -R pyuser:pygroup manage.py
RUN chown -R pyuser:pygroup requirements
RUN chown -R pyuser:pygroup hello/

USER pyuser

RUN python manage.py collectstatic --no-input



