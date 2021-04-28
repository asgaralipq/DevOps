su - wordpress
wget https://wordpress.org/latest.tar.gz
tar zxf latest.tar.gz
rm latest.tar.gz
mv wordpress public_html
logout
cd /home/wordpress/public_html
sudo chown -R wordpress:www-data .
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;
sudo systemctl restart php7.4-fpm
sudo systemctl restart nginx
