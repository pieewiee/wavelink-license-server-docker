FROM debian:latest

LABEL maintainer="till.niederauer@googlemail.com"

ENV var1=wavelink \
    DATA_DIR=/data


RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      unzip make zip


COPY ivantiLicenseServerLinux.zip /root
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh
RUN dpkg -I deb/wlcls-4.3.4.0-20110520092552.amd64.deb

EXPOSE 1820/udp 4420/tcp



ENTRYPOINT ["/sbin/entrypoint.sh"]

CMD ["/bin/bash"]