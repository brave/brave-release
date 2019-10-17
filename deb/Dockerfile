FROM ubuntu:bionic
MAINTAINER Ben Kero <bkero@brave.com>

ENV DEBIAN_FRONTEND noninteractive

VOLUME /brave-release
RUN apt -y update && apt install -y gnupg make wget
