#/sbin/bash
echo "SART DEPLOYING"
mkdir $site1_folder

git clone $git_repository >> $installation_log
sudo apt install composer -y >> $installation_log
ls -lsa >> $installation_log
composer install --working-dir=$site1_folder"MonPetitCahier/"
sudo a2dissite 000-default.conf
sudo a2dissite 000-default-ssl.conf
sudo cp -R $deploy_folder/config/mpc.conf /etc/apache2/sites-available/mpc.conf
sudo cp -R $deploy_folder/config/mpc-ssl.conf /etc/apache2/sites-available/mpc-ssl.conf