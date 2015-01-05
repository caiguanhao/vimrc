FROM ubuntu:14.10

MAINTAINER Cai Guanhao (caiguanhao@gmail.com)

WORKDIR /root/.vim

RUN test $(python3 -c 'from urllib.request import urlopen; print(urlopen \
    ("http://ipinfo.io/country").read().decode("utf-8").strip())') \
    = "CN" && sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' \
    /etc/apt/sources.list || true

RUN apt-get update

RUN apt-get install -y --no-install-recommends git vim curl ca-certificates silversearcher-ag

ADD . /root/.vim/

RUN ./install.sh

RUN git submodule update --init --recursive
