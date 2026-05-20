#!/bin/bash

# ==============================================
#     ╔═══════════════════════════════════╗
#     ║   ESHAN HOSTING INSTALLER v3.0   ║
#     ║   Premium Cloud Management Suite  ║
#     ║   Author: Eshan                   ║
#     ╚═══════════════════════════════════╝
# ==============================================

# ==================== PREMIUM COLOR SCHEME ====================
# Core colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'

# Bold variants
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Background colors
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_PURPLE='\033[45m'
BG_CYAN='\033[46m'

# Effects
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
DIM='\033[2m'

# Eshan brand colors
ESHAN_GOLD='\033[38;5;214m'
ESHAN_SILVER='\033[38;5;250m'
ESHAN_BRONZE='\033[38;5;130m'
ESHAN_ROSE='\033[38;5;204m'

# ==================== FUNCTIONS ====================

# Premium header
eshang_header() {
    clear
    echo -e "${ESHAN_GOLD}"
    echo "    ███████╗███████╗██╗  ██╗ █████╗ ███╗   ██╗"
    echo "    ██╔════╝██╔════╝██║  ██║██╔══██╗████╗  ██║"
    echo "    ███████╗███████╗███████║███████║██╔██╗ ██║"
    echo "    ╚════██║╚════██║██╔══██║██╔══██║██║╚██╗██║"
    echo "    ███████║███████║██║  ██║██║  ██║██║ ╚████║"
    echo "    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
    echo -e "${NC}"
    echo -e "    ${ESHAN_SILVER}════════════════════════════════════════════════${NC}"
    echo -e "    ${BWhite}      PREMIUM HOSTING INSTALLER v3.0${NC}"
    echo -e "    ${ESHAN_ROSE}         Created by Eshan ✨${NC}"
    echo -e "    ${ESHAN_SILVER}════════════════════════════════════════════════${NC}"
    echo ""
}

# Elegant separator
separator() {
    echo -e "${ESHAN_SILVER}┌────────────────────────────────────────────────────┐${NC}"
}

# Menu box function
menu_box() {
    local title="$1"
    echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${ESHAN_GOLD}║${BWhite}              $title${ESHAN_GOLD}               ║${NC}"
    echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
}

# Loading animation
loading_animation() {
    echo -ne "${BCyan}"
    for i in {1..3}; do
        echo -ne "█"
        sleep 0.3
    done
    echo -e "${NC}"
}

# Success message
success_msg() {
    echo ""
    echo -e "${BGreen}✓ $1${NC}"
    sleep 1
}

# Error message
error_msg() {
    echo -e "${BRed}✗ $1${NC}"
    sleep 1
}

# Info message
info_msg() {
    echo -e "${BCyan}➜ $1${NC}"
}

# Warning message
warning_msg() {
    echo -e "${BYellow}⚠ $1${NC}"
}

# Progress bar
progress_bar() {
    echo -ne "${BGreen}["
    for i in {1..30}; do
        echo -ne "▓"
        sleep 0.02
    done
    echo -e "] 100%${NC}"
}

# ==================== BOOT SEQUENCE ====================
boot_sequence() {
    eshang_header
    echo ""
    info_msg "Initializing Eshan Hosting Engine..."
    progress_bar
    
    info_msg "Loading Cloud Modules..."
    progress_bar
    
    info_msg "Establishing Secure Connection..."
    progress_bar
    
    info_msg "Verifying System Requirements..."
    progress_bar
    
    echo ""
    success_msg "System Ready!"
    sleep 1
}

# ==================== INSTALLATION SUCCESS ====================
installation_complete() {
    clear
    eshang_header
    echo ""
    echo -e "${BGreen}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BGreen}║          🎉 INSTALLATION COMPLETE! 🎉            ║${NC}"
    echo -e "${BGreen}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BWhite}✨ What's Next?${NC}"
    echo -e "  ${ESHAN_ROSE}• Configure your settings${NC}"
    echo -e "  • Start your services${NC}"
    echo -e "  • Access your dashboard${NC}"
    echo ""
    echo -e "${ESHAN_GOLD}💎 Need Help? Contact Eshan Support${NC}"
    echo ""
    read -p "$(echo -e ${BWhite}"Press Enter to continue..."${NC})"
}

# ==================== MAIN MENU ====================
main_menu() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}                 📋 MAIN MENU                   ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) 🚀 ${BCyan}Install Panels${NC}                          ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) 🖥️  ${BCyan}Install Nodes${NC}                           ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}3${NC}) 📊 ${BCyan}System Status${NC}                          ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}4${NC}) ℹ️  ${BCyan}About Eshan${NC}                            ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}5${NC}) 🚪 ${BCyan}Exit${NC}                                    ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -ne "${BWhite}➜ Select option: ${NC}"
        read choice

        case $choice in
            1) panels_menu ;;
            2) nodes_menu ;;
            3) system_status ;;
            4) about_eshan ;;
            5) 
                echo -e "${BGreen}👋 Thank you for using Eshan Hosting Installer!${NC}"
                sleep 1
                exit 0 
                ;;
            *) 
                error_msg "Invalid option"
                sleep 1 
                ;;
        esac
    done
}

# ==================== PANELS MENU ====================
panels_menu() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}               🎮 PANELS MENU                   ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) ${BCyan}Skyport Panel${NC}        ${BGreen}[✓ AVAILABLE]${NC}          ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) ${BCyan}Puffer Panel${NC}         ${BYellow}[⟳ COMING SOON]${NC}         ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}3${NC}) ${BCyan}Draco Panel${NC}          ${BYellow}[⟳ COMING SOON]${NC}         ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}4${NC}) ${BCyan}AirLink Panel${NC}        ${BYellow}[⟳ COMING SOON]${NC}         ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}5${NC}) 🔙 ${BCyan}Back to Main Menu${NC}                         ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -ne "${BWhite}➜ Select panel: ${NC}"
        read panel_choice

        case $panel_choice in
            1)
                clear
                eshang_header
                echo ""
                info_msg "Installing Skyport Panel..."
                loading_animation
                
                bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)
                
                if [ $? -eq 0 ]; then
                    installation_complete
                else
                    error_msg "Installation failed! Check your connection."
                    sleep 2
                fi
                ;;
            2|3|4)
                clear
                eshang_header
                echo ""
                warning_msg "This panel is currently in development"
                info_msg "Stay tuned for updates from Eshan!"
                echo ""
                read -p "$(echo -e ${BWhite}"Press Enter to continue..."${NC})"
                ;;
            5)
                return
                ;;
            *)
                error_msg "Invalid option"
                sleep 1
                ;;
        esac
    done
}

# ==================== NODES MENU ====================
nodes_menu() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}               🖥️  NODES MENU                    ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) ${BCyan}Skyport Node${NC}           ${BGreen}[✓ FULL SETUP]${NC}           ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) 🔙 ${BCyan}Back to Main Menu${NC}                         ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -ne "${BWhite}➜ Select node: ${NC}"
        read node_choice

        case $node_choice in
            1)
                clear
                eshang_header
                echo ""
                info_msg "Step 1: Installing Wings..."
                loading_animation
                
                bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)
                
                echo ""
                separator
                echo -e "${BYellow}⚙️  CONFIGURATION REQUIRED${NC}"
                separator
                echo ""
                warning_msg "Replace 'http://panellink-3001' with 'http://localhost:3001'"
                echo ""
                echo -ne "${BWhite}📋 Paste your CONFIG command: ${NC}"
                read config_cmd
                
                info_msg "Applying configuration..."
                eval "$config_cmd"
                
                success_msg "Configuration complete!"
                info_msg "Starting node service..."
                node .
                
                installation_complete
                ;;
            2)
                return
                ;;
            *)
                error_msg "Invalid option"
                sleep 1
                ;;
        esac
    done
}

# ==================== SYSTEM STATUS ====================
system_status() {
    clear
    eshang_header
    echo ""
    echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${ESHAN_GOLD}║${BWhite}              📊 SYSTEM STATUS                  ${ESHAN_GOLD}║${NC}"
    echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # System info
    echo -e "${BCyan}🖥️  System Information:${NC}"
    echo -e "  ${BWhite}OS:${NC}      $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo -e "  ${BWhite}Kernel:${NC}  $(uname -r)"
    echo -e "  ${BWhite}Uptime:${NC}  $(uptime -p | sed 's/up //')"
    echo ""
    
    # Resource usage
    echo -e "${BCyan}💾 Resource Usage:${NC}"
    echo -e "  ${BWhite}CPU:${NC}     $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
    echo -e "  ${BWhite}RAM:${NC}     $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
    echo -e "  ${BWhite}Disk:${NC}    $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
    echo ""
    
    # Network info
    echo -e "${BCyan}🌐 Network:${NC}"
    echo -e "  ${BWhite}IP:${NC}      $(curl -s ifconfig.me)"
    echo ""
    
    read -p "$(echo -e ${BWhite}"Press Enter to continue..."${NC})"
}

# ==================== ABOUT ESHAN ====================
about_eshan() {
    clear
    eshang_header
    echo ""
    echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${ESHAN_GOLD}║${BWhite}              ℹ️  ABOUT ESHAN                    ${ESHAN_GOLD}║${NC}"
    echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BWhite}✨ Eshan Hosting Installer v3.0${NC}"
    echo -e "${BCyan}📦 Premium Cloud Management Solution${NC}"
    echo ""
    echo -e "${BYellow}👨‍💻 Developer:${NC}  Eshan"
    echo -e "${BYellow}📅 Version:${NC}     3.0 (Genesis Edition)"
    echo -e "${BYellow}📜 License:${NC}     MIT"
    echo ""
    echo -e "${BCyan}🎯 Features:${NC}"
    echo -e "  • One-click panel installation"
    echo -e "  • Automated node deployment"
    echo -e "  • System health monitoring"
    echo -e "  • Premium support"
    echo ""
    echo -e "${BGreen}💝 Special Thanks:${NC}"
    echo -e "  • JishnuTheGamer - Skyport Resources"
    echo -e "  • Open Source Community"
    echo -e "  • All Eshan Users"
    echo ""
    echo -e "${ESHAN_GOLD}⭐ Eshan - Empowering Cloud Infrastructure ⭐${NC}"
    echo ""
    read -p "$(echo -e ${BWhite}"Press Enter to return to Main Menu..."${NC})"
}

# ==================== MAIN EXECUTION ====================

# Root check
if [[ $EUID -ne 0 ]]; then
    echo -e "${BRed}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BRed}║     ⚠️  ROOT ACCESS REQUIRED!                      ║${NC}"
    echo -e "${BRed}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BYellow}Please run: ${BWhite}sudo bash $0${NC}"
    exit 1
fi

# Start the installer
boot_sequence
main_menu
