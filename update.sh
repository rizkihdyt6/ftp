#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
REPO="https://raw.githubusercontent.com/rizkihdyt6/ftp/main/"
echo -e " [INFO] Downloading Update File"
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Menu Vmess${NC}"
wget -q -O add-vmess "${REPO}vmess/add-vmess.sh"
wget -q -O del-vmess "${REPO}vmess/del-vmess.sh"
wget -q -O extend-vmess "${REPO}vmess/extend-vmess.sh"
wget -q -O trialvmess "${REPO}vmess/trialvmess.sh"
wget -q -O cek-vmess "${REPO}vmess/cek-vmess.sh"
wget -q -O user-vmess "${REPO}vmess/user-vmess.sh"
sleep 0.5
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Menu Bot Notif${NC}"
wget -q -O add-bot-notif "${REPO}bot-notif/add-bot-notif.sh"
wget -q -O del-bot-notif "${REPO}bot-notif/del-bot-notif.sh
sleep 0.5
sleep 2
chmod +x add-vmess
chmod +x del-vmess
chmod +x extend-vmess
chmod +x trialvmess
chmod +x cek-vmess
chmod +x del-bot-notif
chmod +x add-bot-notif
chmod +x bot

echo -e " [INFO] Update Successfully"
rm -rf update.sh
sleep 2
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
exit
