FROM debian:stretch
ENV container docker

### install systemd
RUN apt update && apt -y upgrade
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt -y install systemd resolvconf
RUN systemctl set-default multi-user.target
RUN ln -s /lib/systemd/systemd /sbin/init
CMD ["/sbin/init"]

### install some other packages
RUN apt -y install cron rsyslog logrotate logwatch ssmtp

### install freedombox
RUN DEBIAN_FRONTEND=noninteractive \
        apt -y install freedombox-setup