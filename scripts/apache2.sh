#!/bin/bash -x

source /host/settings.sh

### install apache2
apt-get -y install apache2

### setup the configuration for schooltool
### read more at http://book.schooltool.org/apache.html
cat <<EOF > /etc/apache2/sites-available/plinth.conf
<VirtualHost *:80>
    ServerName $DOMAIN
    RedirectPermanent / https://$DOMAIN/
</VirtualHost>

<VirtualHost *:443>
    ServerName $DOMAIN
    ProxyPass / http://127.0.0.1:7080/++vh++https:$DOMAIN:443/++/

    SSLEngine on
    SSLOptions +FakeBasicAuth +ExportCertData +StrictRequire
    SSLCertificateFile        /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key
    #SSLCertificateChainFile  /etc/ssl/certs/ssl-cert-snakeoil.pem
</VirtualHost>
EOF
### we need to refer to this apache2 config by the name "$DOMAIN.conf" as well
ln /etc/apache2/sites-available/{plinth,$DOMAIN}.conf

### update config and restart apache2
a2enmod ssl proxy proxy_http rewrite
a2ensite plinth
a2dissite 000-default
service apache2 restart

### create a script to check for apache2, and start it if not running
cat <<'EOF' > /usr/local/sbin/apachemonitor.sh
#!/bin/bash
# restart apache if it is down

if ! /usr/bin/pgrep apache2
then
    date >> /usr/local/apachemonitor.log
    rm /var/run/apache2/apache2.pid
    /etc/init.d/apache2 restart
fi
EOF
chmod +x /usr/local/sbin/apachemonitor.sh

### setup a cron job to monitor apache2
cat <<'EOF' > /etc/cron.d/apachemonitor
* * * * * root /usr/local/sbin/apachemonitor.sh >/dev/null 2>&1
EOF
chmod +x /etc/cron.d/apachemonitor
