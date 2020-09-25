FROM python:3.6-stretch

MAINTAINER wenchi0920@gmail.com

ENV VER=1.4.0

RUN apt-get update \
    && apt-get install -y --fix-missing \
            python3 python3-pip gcc python3-dev \
    && pip3 install scrapy==${VER} \
    && apt-get -y autoremove ; apt-get clean ; rm -rf /var/lib/apt/*


WORKDIR /tmp




