#!/bin/bash

# Colors
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear

# ---------------- BOOT SCREEN ----------------
echo -e "${CYAN}"
echo "======================================"
echo "      MR SKY ESHAN BOOT SYSTEM"
echo "======================================"
echo -e "${NC}"

boot() {
    echo -n "[+] "
    echo -n "$1"
    for i in {1..5}; do
        echo -n "."
        sleep 0.3
    done
    echo " ✔"
}

boot "Checking system"
boot "Loading modules"
boot "Preparing installer"
boot "Starting UI"

echo -e "\n${GREEN}[✓] SYSTEM READY${NC}"
sleep 1

# ---------------- UI ----------------
clear

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
    echo -e "${GREEN}[+] Skyport Installation Starting...${NC}"
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

    echo -e "${CYAN}[✓] Skyport Installed${NC}"
    sleep 2
    ;;

2)
    clear
    echo -e "${GREEN}[+] Installing Puffer Panel V1...${NC}"
    sleep 2
    echo -e "${YELLOW}Add your install script here${NC}"
    sleep 2
    ;;

3)
    clear
    echo -e "${GREEN}[+] Installing Draco Panel...${NC}"
    sleep 2
    echo -e "${YELLOW}Add your install script here${NC}"
    sleep 2
    ;;

4)
    clear
    echo -e "${GREEN}[+] Installing AirLink Panel...${NC}"
    sleep 2
    echo -e "${YELLOW}Add your install script here${NC}"
    sleep 2
    ;;

5)
    echo -e "${RED}Exiting MR SKY ESHAN... Goodbye!${NC}"
    sleep 1
    exit 0
    ;;

*)
    echo -e "${RED}Invalid option! Try again.${NC}"
    sleep 1
    ;;

esac

clear

done
