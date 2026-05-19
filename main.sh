#!/bin/bash

# Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
NC="\033[0m"

clear

# BOOT SCREEN
echo "======================================"
echo "        MR SKY ESHAN SYSTEM"
echo "======================================"
echo ""

sleep 1
echo "[+] Booting system..."
sleep 1
echo "[+] Loading Panels..."
sleep 1
echo "[+] Loading Nodes..."
sleep 1
echo "[✓] READY"
sleep 1

# ================= HOME MENU =================
home() {
clear
echo "======================================"
echo "            HOME MENU"
echo "        MR SKY ESHAN HUB"
echo "======================================"

echo "1) Panels List"
echo "2) Nodes List"
echo "3) Exit"
echo ""

read -p "Select option: " opt

case $opt in
1) panels_menu ;;
2) nodes_menu ;;
3) exit 0 ;;
*) echo "Invalid option"; sleep 1; home ;;
esac
}

# ================= PANELS MENU =================
panels_menu() {
clear
echo "======================================"
echo "           PANELS LIST"
echo "======================================"

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

    echo "[✓] Skyport Panel Installed"
    sleep 2
    panels_menu
    ;;

2|3|4)
    echo "Coming soon..."
    sleep 2
    panels_menu
    ;;

5)
    home
    ;;

*)
    echo "Invalid option"
    sleep 1
    panels_menu
    ;;
esac
}

# ================= NODES MENU =================
nodes_menu() {
clear
echo "======================================"
echo "            NODES LIST"
echo "======================================"

echo "1) Skyport Node (FULL SETUP)"
echo "2) Back"
echo ""

read -p "Select option: " n

case $n in

1)
    clear
    echo "======================================"
    echo "        SKYPORT NODE INSTALLER"
    echo "======================================"

    echo "[+] Step 1: Installing Wings..."
    sleep 1

    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

    echo ""
    echo "======================================"
    echo " IMPORTANT CONFIG STEP"
    echo "======================================"
    echo ""
    echo "Replace:"
    echo "  http://panellink-3001"
    echo "WITH:"
    echo "  http://localhost:3001"
    echo ""
    echo "Paste your CONFIG command below:"
    echo ""

    read -p "CONFIG> " config

    echo ""
    echo "[+] Running configuration..."
    eval "$config"

    echo ""
    echo "[+] Starting Node..."
    node .

    echo ""
    echo "======================================"
    echo "  CONGRATULATIONS!"
    echo "  Panel + Node Setup Complete"
    echo "======================================"

    sleep 5
    nodes_menu
    ;;

2)
    home
    ;;

*)
    echo "Invalid option"
    sleep 1
    nodes_menu
    ;;
esac
}

# ================= START =================
home
