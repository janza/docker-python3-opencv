[![Docker Automated buil](https://img.shields.io/docker/automated/jjanzic/docker-python3-opencv.svg)]()

Docker image with python 3.6 and opencv 3.4

Build with `docker image build --build-arg http_proxy=http://172.16.2.30:8080 --build-arg https_proxy=http://172.16.2.30:8080 .`

Proxy has been set for IIT KGP Campus

Usage:

    docker run -it dibyadas/python3-opencv3 python
    >>> import cv2

Image tagged with `:contrib` contains docker image built with [contrib modules](https://github.com/opencv/opencv_contrib/)

List of available docker tags:

- `opencv-3.4.0` (`latest` branch)
- `contrib-opencv-3.4.0` (`contrib` branch)
- `opencv-3.3.0`
- `contrib-opencv-3.3.0`
- `opencv-3.2.0`
- `contrib-opencv-3.2.0`
