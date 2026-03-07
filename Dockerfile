FROM fedora
ARG BUILD_DATE

### About this container
LABEL build_info="danmogger/gps-ntp build-date:- ${BUILD_DATE}"
LABEL maintainer="danmogger <danmogger@gmail.com>"
LABEL documentation="https://github.com/danmogger/gps-ntp"

### Installs
RUN yum -y install gpsd gpsd-clients ntpsec

### Ports
EXPOSE 123/udp

### NTP startup script
COPY newpoint.sh /root/newpoint.sh
COPY gpsd /etc/default/gpsd
COPY ntp.conf /etc/ntp.conf

### Monitor NTP process
HEALTHCHECK CMD ntpq -p || exit 1

### Start script
ENTRYPOINT ["sh", "-c", "/root/newpoint.sh"]
#ENTRYPOINT [ "/bin/sh", "/opt/startup.sh" ]
