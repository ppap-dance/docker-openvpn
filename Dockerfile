FROM debian:9

RUN set -ex; \
    \
    apt-get update -q && \
    apt-get install -qy \
        openvpn \
        iptables; \
    \
    rm -rf /var/lib/apt/lists/*

VOLUME /etc/openvpn

ENV OVPN_REMOTE_ADDR 127.0.0.1

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

EXPOSE 1194/udp

CMD /usr/local/bin/init