#!/bin/bash

clear

echo "======================================"
echo "        MR SKY ESHAN INSTALLER"
echo "======================================"

sleep 1

# MAIN MENU
main_menu() {
    clear
    echo "======================================"
    echo "            MAIN MENU"
    echo "======================================"
    echo "1) Panel Installation"
    echo "2) Node Installation"
    echo "3) Exit"
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
        exit 0
        ;;

    *)
        echo "Invalid option"
        sleep 1
        main_menu
        ;;
    esac
}

# PANEL MENU (replaces old menu)
panel_menu() {
    clear
    echo "======================================"
    echo "        PANEL INSTALLATION"
    echo "======================================"
    echo "1) Skyport Panel"
    echo "2) Back to Main Menu"
    echo ""

    read -p "Select option: " p

    case $p in

    1)
        clear
        echo "[+] Installing Skyport Panel..."
        bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)
        echo "[✓] Panel Installed"
        sleep 3
        main_menu
        ;;

    2)
        main_menu
        ;;
    esac
}

# NODE INSTALLATION FLOW
node_install() {
    clear
    echo "======================================"
    echo "        NODE INSTALLATION"
    echo "======================================"

    echo "[+] Installing Wings/Node..."
    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

    echo ""
    echo "[IMPORTANT STEP]"
    echo "1. Open your panel in browser"
    echo "2. Change URL from localhost:3001 if needed"
    echo "3. Then run: node ."
    echo ""

    echo "Closing in 10 seconds..."
    sleep 10

    exit 0
}

# START
main_menu
