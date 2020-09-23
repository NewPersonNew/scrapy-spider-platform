FROM python:3.6

MAINTAINER gezhaoqiang "gezhaoqiang@optaim.com"

WORKDIR /spider

RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install less
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get -y install cron

WORKDIR /spider

ADD conf /spider/conf

RUN mkdir /etc/scrapyd

ADD conf/scrapyd.conf /etc/scrapyd/scrapyd.conf

RUN mkdir /scrapyd && pip install -i https://pypi.doubanio.com/simple/ -r /spider/conf/requirements.txt
RUN mkdir /scrapyd/logs

ADD conf/start.sh /scrapyd/start.sh

ENV LC_ALL C.UTF-8

EXPOSE 6800 80 5000

ENTRYPOINT /bin/bash /scrapyd/start.sh
