#!/bin/bash

if [ -f /var/lock/subsys/rsync_updates ]; then
    echo "Updates via rsync already running."
    exit 0
fi

epel6_mirror_dir="/var/www/html/repos/centos/epel/6/x86_64"
epel7_mirror_dir="/var/www/html/repos/centos/epel/7/x86_64"
base_dir="/var/www/html/repos/epel/"

touch /var/lock/subsys/rsync_updates

if [[ -d "$epel6_mirror_dir"  && -d "$epel7_mirror_dir" ]] ; then
    rsync  -avSHP --delete rsync://mirror.atl.genesisadaptive.com/epel/6/x86_64/ "$epel6_mirror_dir" && \
    rsync  -avSHP --delete rsync://mirror.atl.genesisadaptive.com/epel/7/x86_64/ "$epel7_mirror_dir" && \
    rsync  -avSHP --delete rsync://mirror.atl.genesisadaptive.com/epel/RPM-GPG-KEY-EPEL-7 "$base_dir" && \
    rsync  -avSHP --delete rsync://mirror.atl.genesisadaptive.com/epel/RPM-GPG-KEY-EPEL-6 "$base_dir" && \
    rm -rf /var/lock/subsys/rsync_updates

else
	echo "Directories doesn't exist"

fi

if [[ $? -eq '0' ]]; then
    echo ""
    echo "Sync successful.."
else
    echo " Syncing failed"
    exit 1
fi
