#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# Install dependencies
sudo apt update -y >/dev/null 2>&1
sudo apt install figlet lolcat -y >/dev/null 2>&1

# Loading Animation
echo ""
echo "Loading..."
sleep 1
clear

# Banner
figlet "ESHAN" | lolcat

echo -e "${CYAN}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "       SKYPORT INSTALLER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${NC}"

while true; do

echo ""
echo -e "${YELLOW}1) Panel Install${NC}"
echo -e "${YELLOW}2) Node Install${NC}"
echo -e "${YELLOW}3) Start Node${NC}"
echo -e "${YELLOW}4) Exit${NC}"
echo ""

read -p "Choose Option: " option

case $option in

1)
    clear
    figlet "PANEL" | lolcat

    echo -e "${GREEN}Installing Panel...${NC}"
    sleep 2

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

    echo ""
    echo -e "${GREEN}SUCCESSFULLY INSTALLED PANEL!${NC}"
    echo -e "${CYAN}Please open a NEW terminal and run the command again.${NC}"
    ;;

2)
    clear
    figlet "NODE" | lolcat

    echo -e "${GREEN}Installing Wings/Node...${NC}"
    sleep 2

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

    cd skyportd || exit

    echo ""
    echo -e "${GREEN}NODE INSTALLED SUCCESSFULLY!${NC}"
    echo -e "${CYAN}Please run your node config now.${NC}"
    ;;

3)
    clear
    figlet "STARTING" | lolcat

    echo -e "${GREEN}Starting Node...${NC}"
    sleep 2

    node .
    ;;

4)
    echo -e "${RED}Goodbye!${NC}"
    exit
    ;;

*)
    echo -e "${RED}Invalid Option!${NC}"
    ;;

esac

done
