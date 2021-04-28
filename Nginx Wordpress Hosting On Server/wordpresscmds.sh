sudo apt-get update
sudo apt-get install mysql-server
sudo apt-get install php-mysql php-fpm monit

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:nginx/stable
sudo apt-get install nginx
sudo systemctl start nginx php7.4-fpm monit
sudo systemctl enable mysql nginx php7.4-fpm monit
sudo mv nginx.conf nginx.conf.DEF
sudo nano nginx.conf
sudo mkdir -p /usr/share/nginx/cache/fcgi

sudo mkdir /run/php-fpm
sudo mv /etc/php/7.4/fpm/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf.ORIG
sudo nano /etc/php/7.4/fpm/php-fpm.conf
sudo rm /etc/php/7.4/fpm/pool.d/www.conf
sudo nano /etc/php/7.4/fpm/pool.d/www.conf
sudo mv /etc/php/7.4/fpm/php.ini /etc/php/7.4/fpm/php.ini.ORIG
sudo nano /etc/php/7.4/fpm/php.ini
sudo systemctl restart php7.4-fpm

sudo /usr/bin/mysql_secure_installation
sudo adduser wordpress
sudo mkdir -p /home/wordpress/logs
sudo chown wordpress:www-data /home/wordpress/logs/
sudo nano /etc/nginx/conf.d/wordpress.conf
sudo rm /etc/nginx/sites-enabled/default
sudo nano /etc/php/7.4/fpm/pool.d/wordpress.conf
sudo rm /etc/php/7.4/fpm/pool.d/www.conf
sudo -u wordpress touch /home/wordpress/logs/phpfpm_error.log
sudo mysql -u root
