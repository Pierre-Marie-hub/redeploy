#!/scbin/sh
#YOU HAVE TO CREATE A FOLDER NAMED /home/<username>/deploy before running script

###VARIABLES###
echo "LOADING VARIABLES"
######
#SYSTEM
linux_user=su2tech
deploy_folder=/home/$linux_user/deploy
installation_log_directory=/home/$linux_user/installation/log
#DATABASE
bdd_user=site1
bdd_password=k2yS5Fh{Rk/cgm;
#APP
domain_name_site1=
ip_server=51.210.9.89
site1_folder=/var/www/html/site1/
site1_preprod_folder=/var/www/html/site1-preprod/


cd $deploy_folder

#CREATE LOG DIRECTORY
echo "LOG'S DIRECTORY CREATION"
if [ -e $installation_log_directory ]; then
  echo "File $installation_log_directory already exists!"
else
  sudo mkdir log/
  sudo chown -R su2tech:ubuntu $installation_log_directory/*
fi

#CREATE LOG FILE
echo "LOG'S FILE CREATION"
date=$(date +%Y%m%d%H%M%S)
installation_log=$installation_log_directory/installation_logs_$date.txt
if [ -e $installation_log ]; then
  echo "File $installation_log already exists!"
else
touch $installation_log
  echo "**logs file**" > $installation_log
  sudo chown -R su2tech:ubuntu $installation_directory/*
fi

ls -lsa >> $installation_log
echo "INITIALISATION ENDED" >> $installation_log



echo "VARIABLES : " >> $installation_log
echo "$date" >> $installation_log
echo "$installation_log" >> $installation_log
echo "$bdd_user" >> $installation_log
echo "$bdd_password" >> $installation_log
echo "$domain_name_site1" >> $installation_log
echo "$ip_server" >> $installation_log
echo "$site1_folder" >> $installation_log
echo "$site1_preprod_folder" >> $installation_log

echo "****START INSTALLATION****" >> $installation_log

echo "Firewall" >> $installation_log
source $deploy_directory/packages/firewall.sh

echo "fail2ban" >> $installation_log
source $deploy_directory/packages/fail2ban.sh

echo "server lamp" >> $installation_log
source $deploy_directory/packages/server_lamp.sh

echo "application" >> $installation_log
source $deploy_directory/packages/deploy_site_1.sh
#source deploy_site2.sh

echo "SSL CERTIFICATION" >> $installation_log

echo "AFTER DEPLOY TESTS" >> $installation_log

echo "reboot" >> $installation_log
