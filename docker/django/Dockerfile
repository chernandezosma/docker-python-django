ARG PYTHONVERSION

FROM ${PYTHONVERSION}

RUN apk update && apk --no-interactive --update --no-cache \
      add vim curl apache2 apache2-utils apache2-mod-wsgi py3-pip py3-virtualenv bash

RUN ln -sf python3 /usr/bin/python
RUN pip install --upgrade pip setuptools
RUN pip install django pydevd-pycharm

ARG PYTHONPATH=${PYTHONPATH}
ARG PIP_REQUIREMENTS=${PIP_REQUIREMENTS}

ENV PYTHONDONTWRITEBYTECODE ${PYTHONDONTWRITEBYTECODE}
ENV PYTHONUNBUFFERED ${PYTHONUNBUFFERED}

# create user for the Django project
RUN addgroup -S pygroup -g 1000
RUN adduser -S pyuser -u 1000 -G pygroup

USER pyuser

RUN export PYTHONPATH=${PYTHONPATH}
RUN export PYTHONDONTWRITEBYTECODE=${PYTHONDONTWRITEBYTECODE}
ENV export PYTHONUNBUFFERED=${PYTHONUNBUFFERED}

WORKDIR ${PYTHONPATH}
RUN pip install --upgrade pip

COPY --chown=pyuser ./src/requirements/. ${PYTHONPATH}/requirements/.
COPY --chown=pyuser ./src/manage.py ${PYTHONPATH}/.

RUN mkdir -p ./static
RUN mkdir -p ./media
RUN mkdir -p ./logs

# install pip requirements and copy sources
RUN pip install --no-cache-dir --force-reinstall -r ${PYTHONPATH}/requirements/dev.txt
COPY --chown=pyuser ./src/hello hello

USER root
RUN chmod -R 775 hello
RUN chmod -R 775 logs
RUN chown -R pyuser:pygroup manage.py
RUN chown -R pyuser:pygroup requirements
RUN chown -R pyuser:pygroup hello/

USER pyuser

RUN python manage.py collectstatic --no-input