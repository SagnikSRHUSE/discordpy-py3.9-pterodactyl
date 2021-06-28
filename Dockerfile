FROM python:3.9-buster

MAINTAINER Sagnik Sasmal, <sagnik@@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Make tmp dir
RUN mkdir /home/container/tmp/

# Install OS deps
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean \
    && apt-get -y install dirmngr curl software-properties-common locales git cmake \
    && apt-get -y install ffmpeg \
    && useradd -m -d /home/container container
    
    # Ensure UTF-8
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

    # Python3.9
RUN python3.9 -m pip install --no-cache-dir discord.py[voice]

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
