#!/bin/bash
GREEN='\033[0;32m'
NC='\e[0m'
echo "Checking VPS"
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
notif_clearcache
echo ""
echo -e " ${GREEN} Back to menu in 2 sec ${NC}"
sleep 1
menu