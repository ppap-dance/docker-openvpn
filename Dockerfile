FROM debian:9

RUN apt-get update -q && \
    apt-get install -qy openvpn iptables curl && \
    rm -rf /var/lib/apt/lists/*

VOLUME /etc/openvpn

ENV SERVER_ADDR 127.0.0.1

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

EXPOSE 1194/udp

CMD /usr/local/bin/init