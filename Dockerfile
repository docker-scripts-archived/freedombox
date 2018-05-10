FROM debian:buster
ENV container docker

### install systemd
RUN apt update && apt -y upgrade
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt -y install systemd resolvconf
RUN systemctl set-default multi-user.target
RUN ln -s /lib/systemd/systemd /sbin/init
CMD ["/sbin/init"]
WORKDIR /host

### install some other packages
RUN apt -y install cron rsyslog logrotate logwatch ssmtp

### install freedombox dependencies
RUN DEBIAN_FRONTEND=noninteractive \
        apt -y install freedombox-setup

### install development dependencies
### see: https://salsa.debian.org/freedombox-team/plinth/blob/master/INSTALL.md
RUN DEBIAN_FRONTEND=noninteractive apt -y install \
    augeas-tools \
    dblatex \
    docbook-utils \
    e2fsprogs \
    fonts-lato \
    gettext \
    gir1.2-glib-2.0 \
    gir1.2-nm-1.0 \
    ldapscripts \
    libjs-bootstrap \
    libjs-jquery \
    libjs-modernizr \
    make \
    network-manager \
    ppp \
    pppoe \
    python3 \
    python3-apt \
    python3-augeas \
    python3-bootstrapform \
    python3-cherrypy3 \
    python3-configobj \
    python3-coverage \
    python3-django \
    python3-django-axes \
    python3-django-captcha \
    python3-django-stronghold \
    python3-gi \
    python3-psutil \
    python3-requests \
    python3-ruamel.yaml \
    python3-setuptools \
    xmlto
