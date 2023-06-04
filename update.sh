#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
REPO="https://raw.githubusercontent.com/rizkihdyt6/ftp/main/"
echo -e " [INFO] Downloading Update File"
sleep 2
rm -rf /tmp/menu
wget "${REPO}menu/menu.zip" >/dev/null 2>&1
    rm -rf /tmp/menu
    mkdir /tmp/menu
    unzip menu.zip -d /tmp/menu/ >/dev/null 2>&1
    rm -rf menu.zip
    chmod +x /tmp/menu/*
    mv /tmp/menu/* /usr/sbin/

echo -e " [INFO] Update Successfully"
mkdir -p /etc/ssh
mkdir -p /etc/vmx
mkdir -p /etc/vls
mkdir -p /etc/tr
mkdir -p /etc/ss
rm -rf update.sh
sleep 2
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
exit
