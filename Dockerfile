FROM python:3
MAINTAINER Josip Janzic <josip.janzic@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python3-dev python3-numpy build-essential \
        checkinstall cmake pkg-config yasm unzip

RUN cd && wget https://github.com/Itseez/opencv/archive/3.0.0.zip \
        && unzip 3.0.0.zip \
        && cd opencv-3.0.0 && mkdir build && cd build \
        && cmake .. && make -j4 && make install \
        && cd && rm -rf opencv-3.0.0 && rm 3.0.0.zip



