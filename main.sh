#!/bin/bash

# Colors
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear

# Boot animation
echo -e "${CYAN}"
echo "[+] Booting MR SKY ESHAN Installer..."
sleep 1
echo "[+] Loading system modules..."
sleep 1
echo "[+] Initializing panels..."
sleep 1
echo "[+] Starting interface..."
sleep 1
echo -e "${GREEN}[✓] Ready!\n${NC}"

sleep 1
clear

# Header
echo -e "${CYAN}"
echo "===================================="
echo "        MR SKY ESHAN"
echo "     Panels Installer Hub"
echo "===================================="
echo -e "${NC}"

# Menu loop
while true; do
    echo ""
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
        echo -e "${GREEN}[+] Installing Skyport...${NC}"
        bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)
        echo -e "${CYAN}[✓] Done!${NC}"
        ;;

    2)
        clear
        echo -e "${GREEN}[+] Installing Puffer Panel V1...${NC}"
        # add your link here
        ;;

    3)
        clear
        echo -e "${GREEN}[+] Installing Draco Panel...${NC}"
        # add your link here
        ;;

    4)
        clear
        echo -e "${GREEN}[+] Installing AirLink Panel...${NC}"
        # add your link here
        ;;

    5)
        echo -e "${RED}Exiting...${NC}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid option!${NC}"
        ;;
    esac
done
