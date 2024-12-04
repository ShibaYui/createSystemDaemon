#!/bin/bash

## Filename: createSystemDaemon.sh
## Author: yu1
## Date: 2024-08-24 17:32:25 +0800
## 
## Description: 
## 		script for setting linux system-daemon


# please do "sudo su" or "su root" before using this script

# you need "re-local.service" and "rc.local" for system-daemon (systemd)

# if rc-local.service is NOT existed, copy local file to systemd path
[ ! -f /etc/systemd/system/rc-local.service ] && cp rc-local.service /etc/systemd/system/

systemctl enable rc-local.service

# if rc.local is NOT existed, create it on /etc/
if [ ! -f "/etc/rc.local" ]; then
    touch /etc/rc.local
    echo \#\!\/bin\/bash >> /etc/rc.local
fi

chmod a+x /etc/rc.local

# then add command which you want to automation-excute in /etc/rc.local
# EX.
# source /root/test.sh
