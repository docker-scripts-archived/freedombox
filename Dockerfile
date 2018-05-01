FROM debian:stable
ENV container docker
ENV TERM dumb

### install systemd
RUN apt update 
# RUN apt-get install -y dialog apt-utils 
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

# RUN apt-get -y install augeas-tools \
#    dblatex \
#    docbook-utils \
#    e2fsprogs \
#    fonts-lato \
#    gettext \
#    gir1.2-glib-2.0 \
#    gir1.2-nm-1.0 \
#    ldapscripts \
#    libjs-bootstrap \
#    libjs-jquery \
#    libjs-modernizr \
#    python3 \
#    python3-apt \
#    python3-augeas \
#    python3-bootstrapform \
#    python3-cherrypy3 \
#    python3-configobj \
#    python3-coverage \
#    python3-django \
#    python3-django-axes \
#    python3-django-captcha \
#    python3-django-stronghold \
#    python3-gi \
#    python3-psutil \
#    python3-requests \
#    python3-ruamel.yaml \
#    python3-setuptools \
#    xmlto
