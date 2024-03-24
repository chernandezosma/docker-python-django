FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt upgrade -y && \
    apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
                   libnss3-dev libssl-dev libreadline-dev libffi-dev \ 
                   libsqlite3-dev wget libbz2-dev

# compile python from source - avoid unsupported library problems
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget build-essential checkinstall libreadline-gplv2-dev \
    libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev \
    libbz2-dev libffi-dev zlib1g-dev && \
    cd /usr/src && \
    wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0a5.tgz && \
    tar xzf Python-3.13.0a5.tgz && \
    cd Python-3.13.0a5 && \
    ./configure --enable-optimizations && \
    make install
    
    
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt update && \
    apt install -y apt-utils vim curl apache2 apache2-utils libapache2-mod-wsgi-py3 \
                   python3-pip python3-venv

RUN ln /usr/bin/python3 /usr/bin/python
RUN ln /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip setuptools
RUN pip install django pydevd-pycharm

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/var/www/hello
ARG PIP_REQUIREMENTS=dev.txt

# create user for the Django project
RUN groupadd -g 1000 pygroup
RUN useradd -ms /bin/bash -u 1000 -g 1000 pyuser

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



