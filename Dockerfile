FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
    g++ \
    python-pip \
    python \
    expat \
    nano \
    vim \
    net-tools \
    && rm -rf /var/lib/apt/list/*
RUN apt-get install -y --no-install-recommends apt-utils build-essential sudo git
RUN apt-get install -y  autoconf automake libtool make
    
ADD harpoon-master /home/harpoon-master 
ADD harpoon /home/harpoon

EXPOSE 8080

RUN cd /home/harpoon-master/ \
    && ./configure --prefix /home/harpoon/

ENV LD_LIBRARY_PATH export LD_LIBRARY_PATH=/home/harpoon-master/src/plugins/     
