FROM centos:latest

RUN yum update -y && yum install -y python3.8

RUN python3.8 -m pip install pip --upgrade
RUN python3.8 -m pip install flask --upgrade

RUN mkdir /opt/app

COPY ./app.py /opt/app

WORKDIR /opt/app

ENV FLASK_APP=app.py

ENTRYPOINT flask run --host 0.0.0.0
