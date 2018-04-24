# FROM ubuntu:16.04
# ENV container docker
# # Don't start any optional services except for the few we need.
# RUN find /etc/systemd/system \
#          /lib/systemd/system \
#          -path '*.wants/*' \
#          -not -name '*journald*' \
#          -not -name '*systemd-tmpfiles*' \
#          -not -name '*systemd-user-sessions*' \
#          -exec rm \{} \;
# RUN systemctl set-default multi-user.target
# CMD ["/sbin/init"]

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

### Update and upgrade and install some other packages.
RUN apt-get update && \
#    apt-get -y upgrade && \
    apt-get -y install cron vim git wget curl unzip \
               rsyslog logrotate ssmtp logwatch

RUN apt-get -y install sudo

RUN apt-get -y install \
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

RUN git clone https://salsa.debian.org/freedombox-team/plinth.git && \
cd plinth && python3 setup.py install

RUN  DEBIAN_FRONTEND=noninteractive apt install -y $(plinth --list-dependencies)

# ENTRYPOINT ["plinth"]
### Install mariadb
# RUN apt-get -y install software-properties-common && \
#     apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
#     add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.2/ubuntu xenial main' && \
#     apt-get update
# RUN DEBIAN_FRONTEND=noninteractive \
#     apt-get -y install mariadb-server mariadb-client

### Install packages required by moodle.
# RUN DEBIAN_FRONTEND=noninteractive \
#     apt-get -y install \
#             sudo apache2 
# RUN DEBIAN_FRONTEND=noninteractive \
#     apt-get -y install plinth 
            # graphviz 
            # aspell \
            # php7.0 libapache2-mod-php7.0 php7.0-pspell php7.0-curl \
            # php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc \
            # php7.0-ldap php7.0-zip php7.0-soap php7.0-mbstring

### Install moosh (http://moosh-online.com/)
# RUN apt-get -y install composer
# RUN git clone git://github.com/tmuras/moosh.git /usr/local/src/moosh && \
#     cd /usr/local/src/moosh && \
#     composer install && \
#     ln -s /usr/local/src/moosh/moosh.php /usr/local/bin/moosh

### Get moodle code from git.
#RUN git clone --progress --verbose git://git.moodle.org/moodle.git /usr/local/src/moodle
#RUN git clone --progress --verbose https://github.com/moodle/moodle /usr/local/src/moodle
