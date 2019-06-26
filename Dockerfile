FROM phusion/baseimage:latest
MAINTAINER Yevhenii Kurtov "yevhenii.kurtov@libraventur.es"

WORKDIR /monero

RUN apt-get update && apt-get install -y bzip2 file
RUN curl -L https://downloads.getmonero.org/cli/linux64 > linux64
RUN echo $(file linux64)
# RUN if [ -n  "$(file linux64 | grep gzip)" ] ; then tar zxvf linux64 --strip-components=2 -C /usr/local/bin/ && rm linux64 ; else tar jxvf linux64 --strip-components=2 -C /usr/local/bin/ && rm linux64 ; fi
RUN if [ -n  "$(file linux64 | grep gzip)" ] ; \
  then \
    tar zxvf linux64 --strip-components=1 -C /usr/local/bin/ && rm linux64 ; \
  else \
    tar jxvf linux64 --strip-components=1 -C /usr/local/bin/ && rm linux64 ; \
  fi

RUN apt-get -y remove bzip2 file
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/monero/blockchain"]
EXPOSE 18081 18082 28081 38081
CMD /entrypoint.sh
