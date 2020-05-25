#sbin/bash
###VARIABLES###
echo "LOADING VARIABLES"
######
#SYSTEM
linux_user=pierre-marie
deploy_folder=/home/$linux_user/developpements/mon-petit-cahier.fr/deploy/redeploy
installation_log_directory=$deploy_folder/log
#DATABASE
bdd_user=site1
bdd_password=k2yS5Fh{Rk/cgm;
#APP
domain_name_site1=
ip_server=51.210.9.89

site1_folder=/var/www/html/
site1_preprod_folder=/var/www/html/preprod/
git_repository=git@github.com:Pierre-Marie-hub/MonPetitCahier.git

sudo mkdir $site1_folder 
sudo chown -R $linux_user $site1_folder
cd $deploy_folder

#CREATE LOG DIRECTORY
echo "LOG'S DIRECTORY CREATION"
if [ -e $installation_log_directory ]; then
  echo "File $installation_log_directory already exists!"
else
  mkdir log/

fi

#CREATE LOG FILE
echo "LOG'S FILE CREATION"
date=$(date +%Y%m%d%H%M%S)
installation_log=$installation_log_directory/installation_logs_$date.txt
if [ -e $installation_log ]; then
  echo "File $installation_log already exists!"
else
  echo "**logs file**$installation_log" > $installation_log
    touch $installation_log
    echo "ok"
    sudo chown -R $linux_user $installation_log_directory
fi

ls -lsa >> $installation_log
echo "INITIALISATION ENDED" >> $installation_log