FROM python:3.6
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
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev \
	liblapacke-dev \
        libopenblas-dev

RUN pip install numpy

WORKDIR /
RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.2.0.zip \
&& wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip \
&& unzip -q opencv.zip \
&& unzip -q opencv_contrib.zip \
&& rm opencv.zip \
&& rm opencv_contrib.zip \
&& mkdir opencv-3.2.0/build \
&& cd opencv-3.2.0/build \
&& cmake -DBUILD_TIFF=ON \
  -DENABLE_AVX=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.2.0/modules \
  -DBUILD_NEW_PYTHON_SUPPORT=ON \
  -DCMAKE_INSTALL_PREFIX=$(python3.6 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python3.6) \
  -DPYTHON_INCLUDE_DIR=$(python3.6 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python3.6 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
&& make -j$(getconf _NPROCESSORS_ONLN) \
&& make install

