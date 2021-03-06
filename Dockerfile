FROM debian:latest

LABEL maintainer="till.niederauer@googlemail.com"

ENV var1=wavelink \
    DATA_DIR=/data


RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      unzip make zip sudo bind9


COPY ivantiLicenseServerLinux.zip /root
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

WORKDIR "/root"
RUN unzip /root/ivantiLicenseServerLinux.zip
RUN nohup bash -c 'dpkg -i --force-depends  /root/deb/wlcls-4.3.4.0-20110520092552.amd64.deb'

EXPOSE 1820/udp 4420/tcp


#CMD ["/usr/bin/LicenseServer" "-w" "/etc/wlcls" "-d"]



ENTRYPOINT ["/sbin/entrypoint.sh"]

CMD ["/usr/sbin/named"]

