FROM haproxy:1.6-alpine

MAINTAINER zsx <thinkernel@gmail.com>

RUN set -x \
    && apk add --update --no-cache bash curl

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 29418
