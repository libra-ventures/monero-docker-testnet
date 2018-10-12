FROM phusion/baseimage:latest
MAINTAINER Yevhenii Kurtov "yevhenii.kurtov@libraventur.es"

WORKDIR /monero

RUN apt-get update && apt-get install -y bzip2
RUN curl -L https://downloads.getmonero.org/cli/linux64 > linux64.tar.bz2
RUN tar jxvf linux64.tar.bz2 --strip-components=2 -C /usr/local/bin/ && rm linux64.tar.bz2
RUN apt-get -y remove bzip2
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/monero/blockchain"]
EXPOSE 18081 18082 28081 38081
CMD /entrypoint.sh
