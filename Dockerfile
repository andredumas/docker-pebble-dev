FROM ubuntu:14.04
MAINTAINER André Dumas

# Instructions as per http://developer.getpebble.com/sdk/install/linux/

RUN apt-get update && apt-get install -y \
    curl \
    python2.7-dev \
    python-pip

ENV PEBBLE_VERSION PebbleSDK-3.0
ENV PEBBLE_HOME /opt/$PEBBLE_VERSION
ENV PATH $PEBBLE_HOME/bin:$PATH

RUN curl -sSL http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/$PEBBLE_VERSION.tar.gz \
		| tar -v -C /opt -xz

RUN curl -sSL http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-ubuntu-universal.tar.gz \
		| tar -v -C $PEBBLE_HOME -xz

WORKDIR $PEBBLE_HOME

RUN /bin/bash -c " \
    pip install virtualenv \
    && virtualenv --no-site-packages .env \
    && source .env/bin/activate \
    && pip install -r requirements.txt \
    && deactivate \
    "

VOLUME /pebble
WORKDIR /pebble

ENTRYPOINT ["pebble"]