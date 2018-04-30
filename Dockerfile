FROM debian:stretch
ENV container docker

### install systemd
RUN apt update && apt -y upgrade
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt -y install systemd resolvconf
RUN systemctl set-default multi-user.target
RUN ln -s /lib/systemd/systemd /sbin/init
CMD ["/sbin/init"]

### install other tools
#RUN apt -y install vim git wget curl unzip
#RUN DEBIAN_FRONTEND=noninteractive \
#        apt -y install ...
