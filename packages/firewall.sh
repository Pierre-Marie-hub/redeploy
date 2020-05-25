#!/scbin/sh
echo "UFW : SART INSTALLATION"
sudo apt install ufw >> $installation_log
sudo ufw status >> $installation_log
sudo ufw allow 80 >> $installation_log
sudo ufw allow 443 >> $installation_log
sudo ufw enable >> $installation_log



