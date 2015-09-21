FROM elenaalexandrovna/opencv-python3
MAINTAINER Josip Janzic <josip.janzic@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python3-dev python3-numpy build-essential \
        checkinstall cmake pkg-config yasm unzip python3-pip

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
