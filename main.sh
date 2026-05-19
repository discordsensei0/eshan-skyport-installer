#!/bin/bash

# Colors (clean & safe)
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m"

clear

# Boot screen
echo -e "${CYAN}"
echo "======================================"
echo "        MR SKY ESHAN"
echo "     Installer Boot System"
echo "======================================"
echo -e "${NC}"

boot() {
    echo -n "[+] $1"
    for i in 1 2 3 4 5; do
        echo -n "."
        sleep 0.2
    done
    echo " ✔"
}

boot "Checking system"
boot "Loading modules"
boot "Starting menu"

echo -e "\n${GREEN}[✓] READY${NC}"
sleep 1
clear

# Menu loop
while true; do

echo -e "${CYAN}"
echo "======================================"
echo "          MR SKY ESHAN"
echo "       Panels Installer Hub"
echo "======================================"
echo -e "${NC}"

echo -e "${YELLOW}1) Skyport Installer${NC}"
echo -e "${YELLOW}2) Puffer Panel V1${NC}"
echo -e "${YELLOW}3) Draco Panel${NC}"
echo -e "${YELLOW}4) AirLink Panel${NC}"
echo -e "${YELLOW}5) Exit${NC}"
echo ""

read -p "Select option: " opt

case $opt in

1)
    clear
    echo -e "${GREEN}[+] Running Skyport Installer...${NC}"
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

    echo -e "${CYAN}[✓] Done${NC}"
    sleep 2
    ;;

2)
    clear
    echo -e "${GREEN}[+] Running Puffer Panel...${NC}"
    sleep 1
    echo "Add your installer here"
    sleep 2
    ;;

3)
    clear
    echo -e "${GREEN}[+] Running Draco Panel...${NC}"
    sleep 1
    echo "Add your installer here"
    sleep 2
    ;;

4)
    clear
    echo -e "${GREEN}[+] Running AirLink Panel...${NC}"
    sleep 1
    echo "Add your installer here"
    sleep 2
    ;;

5)
    echo -e "${RED}Exiting... Bye!${NC}"
    exit 0
    ;;

*)
    echo -e "${RED}Invalid option!${NC}"
    sleep 1
    ;;

esac

clear

done
