#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
source /usr/local/sbin/spiner
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/proj3c/my.id/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/proj3c/my.id/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

if [ ! -e /etc/bot/version ]; then
    mkdir -p /etc/bot/version
fi

wget -O /etc/bot/version/versi "https://raw.githubusercontent.com/proj3c/my.id/main/bot/install" >/dev/null 2>&1

#isi data
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
echo -e "\e[32mloading...\e[0m"
read -e -p "[*] Input Your Id Telegram :" admin
echo -e "\e[32mloading...\e[0m"
echo -e ""
start_spinner " Please wait, add New data Bot..."
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear
stop_spinner
echo -e " ${Green}Success Add Data BOT...${Suffix}"
echo -e ""
start_spinner " Please wait, Start Service..."
cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
stop_spinner
echo -e " ${Green}Success Service Start...${Suffix}"
cd /root
rm -rf kyt.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot      : $bottoken"
echo "Admin          : $admin"
echo "Domain         : $domain"
echo "Pub            : $PUB"
echo "Host           : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"