FROM mhart/alpine-node:0.12

# inspired by https://github.com/MehrCurry/docker-iobroker

MAINTAINER André Wolski <andre@dena-design.de>

RUN apk update && apk upgrade && apk add bash python

RUN mkdir -p /opt/iobroker/
RUN cd /opt/iobroker && npm install iobroker --unsafe-perm && echo $(hostname) > .install_host
ADD scripts/run.sh /opt/iobroker/run.sh
RUN chmod +x /opt/iobroker/run.sh
VOLUME /opt/iobroker/

EXPOSE 8081
WORKDIR /opt/iobroker/
CMD /opt/iobroker/run.sh
