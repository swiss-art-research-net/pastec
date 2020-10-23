FROM ubuntu:18.04

MAINTAINER lklic
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update \
  && apt-get install -y curl wget vim libopencv-dev libmicrohttpd-dev libjsoncpp-dev cmake git
RUN git clone https://github.com/lklic/pastec.git /pastec
RUN mkdir -p /pastec/build && mkdir /pastec/data
WORKDIR /pastec/build
RUN cmake ../ && make 
EXPOSE 4212
VOLUME /pastec/
CMD ./pastec -p 4212 /pastec/visualWordsORB.dat
