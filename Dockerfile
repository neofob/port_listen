FROM ubuntu:bionic
LABEL maintainer "tuan t. pham" <tuan@vt.edu>

ENV PKGS="netcat-openbsd" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get dist-upgrade -yq && \
    apt-get install -yq ${PKGS} && \
    apt-get autoclean && \
    apt-get autoremove -yq && \
    rm -fr /tmp/* /var/lib/apt/lists/* 

COPY ./port_listen.sh /

ENTRYPOINT ["/port_listen.sh"]
