FROM ubuntu:15.04
MAINTAINER Josip Janzic <josip.janzic@gmail.com>

RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        python3-dev \
        python3-numpy \
        python3-pip \
        python3-flake8 \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev \
        && apt-get -y clean all \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN wget https://github.com/Itseez/opencv/archive/3.0.0.zip \
&& unzip 3.0.0.zip \
&& mkdir /opencv-3.0.0/cmake_binary \
&& cd /opencv-3.0.0/cmake_binary \
&& cmake .. \
&& make install \
&& rm /3.0.0.zip \
&& rm -r /opencv-3.0.0

RUN rm /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install flake8 --upgrade
