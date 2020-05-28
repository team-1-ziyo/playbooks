#!/bin/bash

if [ -f /var/lock/subsys/rsync_updates ]; then
    echo "Updates via rsync already running."
    exit 0
fi

base_dir="/var/www/html/repos/centos/"
centos_7_mirror_dir="/var/www/html/repos/centos/7/"
centos_6_mirror_dir="/var/www/html/repos/centos/6/"

touch /var/lock/subsys/rsync_updates

if [[ -d "$centos_7_mirror_dir"  && -d "$centos_6_mirror_dir" ]] ; then
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/7.8.2003/os/  "$centos_7_mirror_dir"os && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/7.8.2003/updates/  "$centos_7_mirror_dir"updates && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/7.8.2003/extras/  "$centos_7_mirror_dir"extras && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/7.8.2003/centosplus/  "$centos_7_mirror_dir"centosplus && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/6.10/os/x86_64/  "$centos_6_mirror_dir"os/x86_64 && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/6.10/updates/x86_64/  "$centos_6_mirror_dir"updates/x86_64 && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/6.10/extras/x86_64/  "$centos_6_mirror_dir"extras/x86_64 && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/6.10/centosplus/x86_64/  "$centos_6_mirror_dir"centosplus/x86_64 && \
    # sync keys
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/RPM-GPG-KEY-CentOS-7  "$base_dir" && \
    rsync  -avSHP --delete rsync://mirror.liquidtelecom.com/centos/RPM-GPG-KEY-CentOS-6  "$base_dir" && \
    rm -rf /var/lock/subsys/rsync_updates

else
	echo "Directories doesn't exist"

fi
