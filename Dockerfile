# The HipHop virtual machine (HHVM) is a high-performance just-in-time compiled
# PHP runtime.

FROM ubuntu:precise
MAINTAINER Ryan Seto <ryanseto@yak.net>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Ensure UTF-8
RUN apt-get update
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://dl.hhvm.com/ubuntu precise main" > /etc/apt/sources.list.d/hhvm.list && \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes hhvm-fastcgi
