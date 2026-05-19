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
    echo -e "${GREEN}[+] Running Puffer Panel...${NC#!/bin/bash

clear

# Boot screen
echo "======================================"
echo "        MR SKY ESHAN"
echo "     Installer Boot System"
echo "======================================"

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

echo ""
echo "[✓] READY"
sleep 1
clear

# Menu loop
while true; do

echo "======================================"
echo "          MR SKY ESHAN"
echo "       Panels Installer Hub"
echo "======================================"

echo "1) Skyport Installer"
echo "2) Puffer Panel V1"
echo "3) Draco Panel"
echo "4) AirLink Panel"
echo "5) Exit"
echo ""

read -p "Select option: " opt

case $opt in

1)
    clear
    echo "[+] Running Skyport Installer..."
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

    echo "[✓] Done"
    sleep 2
    ;;

2)
    clear
    echo "[+] Running Puffer Panel..."
    sleep 1
    echo "Installer not added yet"
    sleep 2
    ;;

3)
    clear
    echo "[+] Running Draco Panel..."
    sleep 1
    echo "Installer not added yet"
    sleep 2
    ;;

4)
    clear
    echo "[+] Running AirLink Panel..."
    sleep 1
    echo "Installer not added yet"
    sleep 2
    ;;

5)
    echo "Exiting... Bye!"
    exit 0
    ;;

*)
    echo "Invalid option!"
    sleep 1
    ;;

esac

clear

done
