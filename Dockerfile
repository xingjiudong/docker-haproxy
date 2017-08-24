FROM haproxy:1.7

MAINTAINER xingjiudong <25635680@qq.com>

RUN apt-get update && apt-get install rsyslog -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf && \
    sed -i 's/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf

COPY haproxy.conf /etc/rsyslog.d
COPY docker-entrypoint.sh /
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 27017

ENTRYPOINT ["/docker-entrypoint.sh"]
