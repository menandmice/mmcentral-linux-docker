# Debian 8 with mmcentral
# Version 8.1.5
FROM debian:latest
LABEL vendor="Men & Mice" maintainer="<services@menandmice.com>" version="8.1.5-docker-beta" Description="Men & Mice Suite Central"

# Update image
RUN DEBIAN_FRONTEND=noninteractive apt update && apt -y upgrade && apt -y install python wget && apt-get clean
RUN wget -q http://ftp.menandmice.com/pub/mmsuite/Linux/8.1.5/mmsuite-central-8.1.5.linux.x64.tgz && tar xvfz mmsuite-central*.tgz && (cd /mmsuite-central-* && ./install && cd / && rm -rf /mmsuite-central-* && pkill mmcentrald && rm /var/mmsuite/mmcentral/mmsuite.db* )
VOLUME ["/var/mmsuite"]
EXPOSE 1231
WORKDIR /var/mmsuite
CMD ["/usr/sbin/mmcentrald","-f","-uroot","-groot","-d/var/mmsuite/mmcentral"]
