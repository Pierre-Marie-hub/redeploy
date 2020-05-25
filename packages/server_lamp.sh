#/sbin/bash
echo "****LAMP : START INSTALLATION****"
sudo apt install apache2 php libapache2-mod-php mysql-server php-mysql -y
sudo apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip -y
echo "****LAMP : START CONFIGURATION****"