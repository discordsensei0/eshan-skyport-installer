#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

# Install figlet if missing
if ! command -v figlet &> /dev/null
then
    sudo apt update -y
    sudo apt install figlet -y
fi

# Banner
echo -e "${CYAN}"
figlet "ESHAN"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "        VPS MANAGER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

while true; do
    echo ""
    echo -e "${YELLOW}Select an Option:${NC}"
    echo ""
    echo "1) Panel Install"
    echo "2) Node Install"
    echo "3) Start Node"
    echo "4) Exit"
    echo ""

    read -p "Enter Choice: " choice

    case $choice in

        1)
            clear
            echo -e "${GREEN}Installing Panel...${NC}"
            sleep 2

            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

            echo ""
            echo -e "${GREEN}SUCCESSFULLY INSTALLED PANEL!${NC}"
            echo ""
            echo -e "${CYAN}Open a NEW terminal and run the command again.${NC}"
            ;;

        2)
            clear
            echo -e "${GREEN}Installing Wings/Node...${NC}"
            sleep 2

            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

            cd skyportd || exit

            echo ""
            echo -e "${GREEN}NODE INSTALLED SUCCESSFULLY!${NC}"
            echo ""
            echo -e "${CYAN}Please run your node config now.${NC}"
            ;;

        3)
            clear
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