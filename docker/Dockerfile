FROM debian:stretch
LABEL maintainer="ZOOW Developers <dev@zoow.org>"
LABEL description="Dockerised ZOOWCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
