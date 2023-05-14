#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
REPO="https://raw.githubusercontent.com/rizkihdyt6/ftp/main/"
echo -e " [INFO] Downloading Update File"
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Main Menu${NC}"
wget -q -O vmess "${REPO}menu/vmess.sh" && chmod +x vmess
wget -q -O bot "${REPO}menu/bot.sh" && chmod +x bot
sleep 0.5
echoo -e "${GB}[ INFO ]${NC} ${YB}Downloading Menu Vmess${NC}"
wget -q -O add-vmess "${REPO}vmess/add-vmess.sh" && chmod +x add-vmess
wget -q -O del-vmess "${REPO}vmess/del-vmess.sh" && chmod +x del-vmess
wget -q -O extend-vmess "${REPO}vmess/extend-vmess.sh" && chmod +x extend-vmess
wget -q -O trialvmess "${REPO}vmess/trialvmess.sh" && chmod +x trialvmess
wget -q -O cek-vmess "${REPO}vmess/cek-vmess.sh" && chmod +x cek-vmess
wget -q -O user-vmess "${REPO}vmess/user-vmess.sh" && chmod +x user-vmess
sleep 0.5
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Menu Bot Notif${NC}"
wget -q -O add-bot-notif "${REPO}bot-notif/add-bot-notif.sh"
wget -q -O del-bot-notif "${REPO}bot-notif/del-bot-notif.sh"
sleep 0.5
sleep q
echo -e " [INFO] Update Successfully"
rm -rf update.sh
sleep 2
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
exit
