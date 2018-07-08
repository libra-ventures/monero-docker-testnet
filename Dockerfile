FROM alpine:edge
MAINTAINER Yevhenii Kurtov "yevhenii.kurtov@libraventur.es"

WORKDIR /monero

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache --update monero

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/monero/blockchain"]
EXPOSE 18081 18082 28081 38081
CMD /entrypoint.sh
