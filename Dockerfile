# Base docker image
FROM debian:jessie
MAINTAINER Jesper Henriksen <mail-docker@jesper.io>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		wget \
		unzip \
		libudev-dev \
		libqt5gui5 \
		libqt5core5a \
		libqt5opengl5 \
		libqt5network5 \
		libglu1-mesa \
		libqt5xml5 \
		libgl1-mesa-dri xserver-xorg-video-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser --disabled-password --gecos '' --home /home/flashprint flashprint

#	&& echo "flashprint flashforge/title note "|debconf-set-selections \
#    && dpkg -i /tmp/flashprint.deb

# http://www.flashforge.com/support-center/flashprint-support/

## FlashPrint 3.21.0 (not working)
#RUN wget http://www.sz3dp.com/upfile/2018/01/25/20180125091409_766.deb -O /tmp/flashprint.deb \

##  FlashPrint 3.19.1 (latest working version)
RUN wget http://www.sz3dp.com/upfile/2017/10/09/20171009094159_956.deb -O /tmp/flashprint.deb \
	&& echo "flashprint flashforge/title note "|debconf-set-selections \
    && dpkg -i /tmp/flashprint.deb

USER flashprint
CMD ["/usr/share/FlashPrint/FlashPrint"]
