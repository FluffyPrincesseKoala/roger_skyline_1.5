
mkdir /home/koala/html
mkdir /home/koala/server

git init --bare /home/koala/server
cp post-receive /home/koala/server/hooks

cp -f hosts /etc/hosts

cp -f roger-skyline.com.key /etc/ssl/private/
cp -f roger-skyline.com.crt /etc/ssl/certs/
cp -f ssl-params.conf /etc/apache2/conf-available/ssl-params.conf
cp -f default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
cp -f 000-default.conf /etc/apache2/sites-available/000-default.conf

/sbin/a2enmod ssl
/sbin/a2enmod headers
/sbin/a2ensite default-ssl
/sbin/a2enconf ssl-params
/sbin/apache2ctl configtest
systemctl reload apache2