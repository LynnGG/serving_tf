FROM python:3
FROM ubuntu:latest
FROM tensorflow/serving


COPY ./model/mnist/ /model/mnist/

COPY ./models.config /model/models.config
ENV MODEL_CONFIG_FILE=/model/models.config

COPY requirements.txt /code/requirements.txt

WORKDIR /code

ADD . /code

RUN apt-get update && apt-get install python3-pip -y

RUN pip3 install --upgrade setuptools && pip3 install --upgrade pip && pip3 install -r requirements.txt 

