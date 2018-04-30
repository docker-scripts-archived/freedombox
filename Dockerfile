FROM debian:buster
ENV container docker
ENV TERM dumb

### install systemd
RUN apt update 
RUN apt-get install -y dialog apt-utils 
#&& apt -y upgrade
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt -y install systemd resolvconf
RUN systemctl set-default multi-user.target
RUN ln -s /lib/systemd/systemd /sbin/init
CMD ["/sbin/init"]
### install other tools
#RUN apt -y install vim git wget curl unzip
#RUN DEBIAN_FRONTEND=noninteractive \
#        apt -y install ...
### Update and upgrade and install some other packages.
RUN apt-get update && \
#    apt-get -y upgrade && \
    apt-get -y install cron vim git wget curl unzip \
               rsyslog w3m logrotate ssmtp logwatch

RUN apt-get -y install sudo
