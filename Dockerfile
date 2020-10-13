FROM python:3.6-stretch


MAINTAINER wenchi0920@gmail.com

ENV VER=1.0.7
ENV TZ=Asia/Taipei
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get install -y --fix-missing \
            python3 python3-pip gcc python3-dev locales tzdata bash-completion \
    && pip3 install scrapy==${VER} \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && echo "zh_TW BIG5" > /etc/locale.gen \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get -y autoremove ; apt-get clean ; rm -rf /var/lib/apt/*



WORKDIR /tmp




