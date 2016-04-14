FROM node:argon

MAINTAINER Irek Romaniuk

# Create user pan2influx in group pan2influx
RUN groupadd -r pan2influx \
    && useradd -m -r -g pan2influx pan2influx \
    && apt-get update -y \
    && apt-get -y install inetutils-ping dos2unix \
    && chown -R pan2influx /home/pan2influx \
    && chgrp -R pan2influx /home/pan2influx

WORKDIR /home/pan2influx
# Install app dependencies
COPY  package.json  /home/pan2influx/
RUN npm install
COPY pan2influx.js /home/pan2influx/
#USER pan2influx
CMD ["npm", "start"]
