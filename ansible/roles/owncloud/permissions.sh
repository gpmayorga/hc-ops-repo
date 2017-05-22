#!/bin/bash
ocpath='"{{ owncloud_root_directory }}"/owncloud'
datapath='/var/lib/owncloud/data'
htuser='nginx'
htgroup='nginx'
rootuser='root'

printf "Creating possible missing Directories\n"
mkdir -p $datapath/data
mkdir -p $ocpath/assets
mkdir -p $ocpath/updater

printf "chmod Files and Directories\n"
find ${ocpath}/ -type f -print0 | xargs -0 chmod 0640
find ${ocpath}/ -type d -print0 | xargs -0 chmod 0750

printf "chown Directories\n"
chown -R ${rootuser}:${htgroup} ${ocpath}/
chown -R ${htuser}:${htgroup} ${ocpath}/apps/
chown -R ${htuser}:${htgroup} ${ocpath}/assets/
chown -R ${htuser}:${htgroup} ${ocpath}/config/
chown -R ${htuser}:${htgroup} ${datapath}/data/
chown -R ${htuser}:${htgroup} ${ocpath}/themes/
chown -R ${htuser}:${htgroup} ${ocpath}/updater/
chown -R ${htuser}:${htgroup} ${ocpath}/owncloud/
chmod +x ${ocpath}/owncloud/occ

printf "chmod/chown .htaccess\n"
if [ -f ${ocpath}/owncloud/.htaccess ]
 then
  chmod 0644 ${ocpath}/owncloud/.htaccess
  chown ${rootuser}:${htgroup} ${ocpath}/owncloud/.htaccess
fi
if [ -f ${ocpath}/data/owncloud/.htaccess ]
 then
  chmod 0644 ${ocpath}/data/owncloud/.htaccess
  chown ${rootuser}:${htgroup} ${datapath}/data/owncloud/.htaccess
fi
