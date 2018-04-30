#!/bin/bash -x

source /host/settings.sh

# DEBIAN_FRONTEND=noninteractive apt-get -y install plinth

apt-get -y install \
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
git clone https://salsa.debian.org/freedombox-team/plinth.git && \
cd plinth && python3 setup.py install
DEBIAN_FRONTEND=noninteractive apt install -y $(plinth --list-dependencies)
# # plinth
# sudo rm /var/cache/debconf/*.dat
# sudo dpkg-reconfigure debconf