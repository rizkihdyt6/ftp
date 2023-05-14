#!/bin/bash
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vm# " "/etc/vmess/.vmess.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}Extend Vmess Account${NC}               "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
vmess
fi
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}Extend Vmess Account${NC}               "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo "     ${YB}NO    User    Expired${NC}  "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2-3 | nl -s ') '
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "${YB}tap enter to go back${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client you want to renew [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER

        fi
	done
read -p "Extend (days): " masaaktif
user=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vm# $user $exp/#vm# $user $exp4/g" /usr/local/etc/xray/config.json
sed -i "s/#vm# $user $exp/#vm# $user $exp4/g" /etc/vmess/.vmess.db
systemctl restart xray
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "           ${WB}Vmess Account Success Extended${NC}            "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${YB}Client Name :${NC} $user"
echo -e " ${YB}Expired On  :${NC} $exp4"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
vmess
