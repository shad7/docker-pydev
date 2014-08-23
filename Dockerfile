FROM ubuntu:trusty

MAINTAINER shad7 <kenny.shad7@gmail.com>

# Update
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y build-essential \
                       python-dev \
                       python-pip \
                       git \
                       bash-completion \
                       wget \
                       curl \
                       software-properties-common

RUN pip install virtualenv

# nginx install
RUN wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx"  >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y nginx

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

# start install pythons
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DB82666C
RUN add-apt-repository ppa:fkrull/deadsnakes

RUN apt-get update

# python2.6
RUN apt-get install -y python2.6-complete

# python2.7
RUN apt-get install -y python-all-dev

# python3.2
RUN apt-get install -y python3.2-complete

# python3.3
RUN apt-get install -y python3.3-complete

# python3.4
RUN apt-get install -y python3-all-dev

# pypy
RUN apt-get install -y pypy
RUN apt-get install -y pypy-dev

# publish the default web port
EXPOSE 80

CMD ["nginx"]



