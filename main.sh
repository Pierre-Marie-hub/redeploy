#!/scbin/sh
#YOU HAVE TO CREATE A FOLDER NAMED /home/<username>/deploy before running script


source /config/config.sh


echo "VARIABLES : " >> $installation_log
echo "$date" >> $installation_log
echo "$installation_log" >> $installation_log
echo "$bdd_user" >> $installation_log
echo "$bdd_password" >> $installation_log
echo "$domain_name_site1" >> $installation_log
echo "$ip_server" >> $installation_log
echo "$site1_folder" >> $installation_log
echo "$site1_preprod_folder" >> $installation_log
echo "$git_repository" >> $installation_log

echo "****START INSTALLATION****" >> $installation_log

echo "Firewall" >> $installation_log
source $deploy_folder/packages/firewall.sh

echo "fail2ban" >> $installation_log
source $deploy_folder/packages/fail2ban.sh

echo "server lamp" >> $installation_log
source $deploy_folder/packages/server_lamp.sh

echo "application" >> $installation_log
source $deploy_folder/packages/deploy_site_1.sh


echo "SSL CERTIFICATION" >> $installation_log

echo "AFTER DEPLOY TESTS" >> $installation_log

echo "reboot" >> $installation_log
