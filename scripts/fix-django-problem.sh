#!/bin/bash -x

### Fix a Django problem with multiple proxy redirections.
sed -i /etc/apache2/sites-enabled/plinth.conf \
    -e '/Fix a Django problem/,+4 d'
sed -i /etc/apache2/sites-enabled/plinth.conf \
    -e '/RequestHeader    set/ a\
    \
    ## Fix a Django problem with multiple proxy redirections.\
    RequestHeader    unset X-Forwarded-For\
    RequestHeader    unset X-Forwarded-Server\
    RequestHeader    unset X-Forwarded-Host'

# ### Alternatively, modify plinth config
# sed -i /etc/plinth/plinth.config \
#   -e '/^use_x_forwarded_host/ c use_x_forwarded_host = False/' \
#   -e '/^secure_proxy_ssl_header/c secure_proxy_ssl_header = None/'
