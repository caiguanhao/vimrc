FROM ubuntu:14.10

MAINTAINER Cai Guanhao (caiguanhao@gmail.com)

RUN mkdir -p /root/.vim/bundle

WORKDIR /root/.vim

RUN test $(python3 -c 'from urllib.request import urlopen; print(urlopen \
    ("http://ipinfo.io/country").read().decode("utf-8").strip())') \
    = "CN" && sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' \
    /etc/apt/sources.list || true

RUN apt-get update

RUN apt-get install -y --no-install-recommends git vim curl ca-certificates cmake build-essential python-dev

RUN cd bundle && git clone https://github.com/Valloric/YouCompleteMe

RUN cd bundle/YouCompleteMe && git submodule update --init --recursive

RUN cd bundle/YouCompleteMe && ./install.sh --clang-completer

RUN git clone https://github.com/ggreer/the_silver_searcher ag

RUN apt-get install -y --no-install-recommends automake pkg-config libpcre3-dev liblzma-dev

RUN cd ag && ./build.sh && make install
