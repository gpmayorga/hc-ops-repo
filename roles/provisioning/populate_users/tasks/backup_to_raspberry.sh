#!/bin/sh

date=`date "+%Y-%m-%dT%H_%M_%S"`
HOME=/home/user
BACKUP_SERVER=guille@raspberrypi

rsync -azP \
  --delete \
  --delete-excluded \
  --exclude-from=$HOME/.rsync/exclude \
  --link-dest=../current \
  $HOME $BACKUP_SERVER:Backups/incomplete_back-$date \
  && $BACKUP_SERVER \
  "mv Backups/incomplete_back-$date Backups/back-$date \
  && rm -f Backups/current \
  && ln -s back-$date Backups/current"