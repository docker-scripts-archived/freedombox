#!/bin/bash -x

source /host/settings.sh

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

DEBIAN_FRONTEND=noninteractive apt-get -y install plinth

# apt-get -y install \
#    make \
#    network-manager \
#    ppp \
#    pppoe \

# git clone https://salsa.debian.org/freedombox-team/plinth.git && \
# cd plinth
# sed -e 's/^use_x_forwarded_host = True/use_x_forwarded_host = False/' -i data/etc/plinth/plinth.config 
# sed -e 's/^secure_proxy_ssl_header = HTTP_X_FORWARDED_PROTO/secure_proxy_ssl_header = None/' -i data/etc/plinth/plinth.config 
# python3 setup.py install
# apt install -y $(plinth --list-dependencies)



# # Hack to reconfigure LDAP. Issue #4
# # Wait until plinth throw users LDAP error. 
# # Then pkill it.
# plinth &
# sleep 90
# pkill plinth
# # Then in config.sh we ds restart

# Alternative way
# apt install -y expect
# cmd='
# set timeout 240
# spawn plinth
# expect "Error executing command"
# send \003
# interact'
# expect -c "${cmd}"