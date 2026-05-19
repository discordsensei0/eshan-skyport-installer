#!/bin/bash

# Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
NC="\033[0m"

# BOOT
clear
echo -e "${MAGENTA}======================================"
echo "        MR SKY ESHAN SYSTEM"
echo "======================================"
echo -e "${NC}"

echo "[+] Booting..."
sleep 1
echo "[+] Loading Panels..."
sleep 1
echo "[+] Loading Nodes..."
sleep 1
echo "[✓] READY"
sleep 1

# ---------------- HOME ----------------
home() {
clear
echo -e "${BLUE}======================================"
echo "            HOME MENU"
echo "        MR SKY ESHAN HUB"
echo "======================================"
echo -e "${NC}"

echo "1) Panels List"
echo "2) Nodes List"
echo "3) Exit"
echo ""

read -p "Select option: " opt

case $opt in
1) panels_menu ;;
2) nodes_menu ;;
3) exit 0 ;;
*) echo "Invalid"; sleep 1; home ;;
esac
}

# ---------------- PANELS ----------------
panels_menu() {
clear
echo -e "${YELLOW}======================================"
echo "           PANELS LIST"
echo "======================================"
echo -e "${NC}"

echo "1) Skyport Panel (WORKING)"
echo "2) Puffer Panel (Coming Soon)"
echo "3) Draco Panel (Coming Soon)"
echo "4) AirLink Panel (Coming Soon)"
echo "5) Back"
echo ""

read -p "Select option: " p

case $p in

1)
    clear
    echo "[+] Installing Skyport Panel..."
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

    echo "[✓] Skyport Installed"
    sleep 2
    panels_menu
    ;;

2)
    echo "Coming soon..."
    sleep 2
    panels_menu
    ;;

3)
    echo "Coming soon..."
    sleep 2
    panels_menu
    ;;

4)
    echo "Coming soon..."
    sleep 2
    panels_menu
    ;;

5)
    home
    ;;

*)
    echo "Invalid"
    sleep 1
    panels_menu
    ;;
esac
}

# ---------------- NODES ----------------
nodes_menu() {
clear
echo -e "${YELLOW}======================================"
echo "            NODES LIST"
echo "======================================"
echo -e "${NC}"

echo "1) Skyport Node (NOT READY)"
echo "2) Back"
echo ""

read -p "Select option: " n

case $n in

1)
    clear
    echo "[+] Skyport Node Setup..."
    echo "Not implemented yet"
    sleep 2
    nodes_menu
    ;;

2)
    home
    ;;

*)
    echo "Invalid"
    sleep 1
    nodes_menu
    ;;
esac
}

# START
home
