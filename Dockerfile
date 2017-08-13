FROM ruby:2.3.4-slim-jessie

MAINTAINER Alexander Harchenko <morontt@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y make g++ libsqlite3-0 libsqlite3-dev --no-install-recommends && \
    gem install mailcatcher --no-rdoc --no-ri  && \
    apt-get remove -y ruby-dev make g++ libsqlite3-dev && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 1080 1025

ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--foreground"]
