#!/bin/bash

# Colors (NO CYAN)
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
NC="\033[0m"

clear

# Boot Screen
echo -e "${BLUE}======================================"
echo "        MR SKY ESHAN INSTALLER"
echo "======================================"
echo -e "${NC}"

sleep 1

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
boot "Starting interface"

echo -e "\n${GREEN}[✓] READY${NC}"
sleep 1

# HOME MENU
home_menu() {
    clear
    echo -e "${BLUE}======================================"
    echo "           HOME MENU"
    echo "        MR SKY ESHAN HUB"
    echo "======================================"
    echo -e "${NC}"

    echo -e "${YELLOW}1) Panel Installation${NC}"
    echo -e "${YELLOW}2) Node Installation${NC}"
    echo -e "${YELLOW}3) Exit${NC}"
    echo ""

    read -p "Select option: " opt

    case $opt in

    1)
        panel_menu
        ;;

    2)
        node_install
        ;;

    3)
        echo -e "${RED}Exiting... Bye!${NC}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid option!${NC}"
        sleep 1
        home_menu
        ;;
    esac
}

# PANEL MENU
panel_menu() {
    clear
    echo -e "${BLUE}======================================"
    echo "      PANEL INSTALLATION MENU"
    echo "======================================"
    echo -e "${NC}"

    echo -e "${YELLOW}1) Skyport Panel${NC}"
    echo -e "${YELLOW}2) Back${NC}"
    echo ""

    read -p "Select option: " p

    case $p in

    1)
        clear
        echo -e "${GREEN}[+] Installing Skyport Panel...${NC}"
        sleep 1

        bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

        echo -e "${GREEN}[✓] Panel Installed${NC}"
        sleep 2

        home_menu
        ;;

    2)
        home_menu
        ;;
    esac
}

# NODE INSTALLATION
node_install() {
    clear
    echo -e "${BLUE}======================================"
    echo "        NODE INSTALLATION"
    echo "======================================"
    echo -e "${NC}"

    echo -e "${GREEN}[+] Installing Wings/Node...${NC}"
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

    echo ""
    echo -e "${YELLOW}IMPORTANT STEPS:${NC}"
    echo "1) Open panel in browser"
    echo "2) Replace localhost:3001 with your VPS IP"
    echo "3) Then run: node ."
    echo ""

    echo -e "${RED}Returning to menu in 10 seconds...${NC}"
    sleep 10

    home_menu
}

# START PROGRAM
home_menu
