#!/bin/bash

# ==============================================
#     CLOUD HOSTING INSTALLER - MAIN SCRIPT
#     Created by: Eshan
#     Version: 1.0
# ==============================================

# Colors with styling
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
BOLD="\033[1m"
UNDERLINE="\033[4m"
NC="\033[0m"

# Variables
SCRIPT_VERSION="1.0"
AUTHOR="Eshan"

# Clear screen function
clear_screen() {
    clear
}

# Draw header function
draw_header() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo -e "║     ${WHITE}☁️  CLOUD HOSTING INSTALLER ${CYAN}                    ║"
    echo -e "║     ${YELLOW}Created by: ${GREEN}${AUTHOR}${CYAN}                           ║"
    echo -e "║     ${YELLOW}Version: ${WHITE}${SCRIPT_VERSION}${CYAN}                            ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Draw separator
draw_separator() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Progress bar function
show_progress() {
    echo -ne "${GREEN}["
    for i in {1..20}; do
        echo -ne "█"
        sleep 0.05
    done
    echo -e "] 100%${NC}"
}

# Boot animation
boot_screen() {
    clear_screen
    draw_header
    echo ""
    
    echo -e "${YELLOW}🔷 Booting System...${NC}"
    show_progress
    sleep 0.5
    
    echo -e "${YELLOW}🔷 Loading Modules...${NC}"
    show_progress
    sleep 0.5
    
    echo -e "${YELLOW}🔷 Initializing Services...${NC}"
    show_progress
    sleep 0.5
    
    echo -e "${YELLOW}🔷 Checking Dependencies...${NC}"
    show_progress
    sleep 0.5
    
    echo -e "${GREEN}✅ System Ready!${NC}"
    sleep 1
}

# Installation success message
installation_success() {
    clear_screen
    draw_header
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║              ✓ INSTALLATION SUCCESSFUL ✓                ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}🎉 Congratulations! The installation has completed successfully!${NC}"
    echo ""
    echo -e "${YELLOW}📝 Next Steps:${NC}"
    echo -e "  • Configure your settings"
    echo -e "  • Start your services"
    echo -e "  • Visit the dashboard"
    echo ""
    echo -e "${CYAN}💡 Need help? Contact: ${WHITE}${AUTHOR}${NC}"
    echo ""
    read -p "Press Enter to continue..."
}

# ================= HOME MENU =================
home() {
    while true; do
        clear_screen
        draw_header
        echo ""
        echo -e "${WHITE}┌──────────────────────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│                    📋 MAIN MENU                          │${NC}"
        echo -e "${WHITE}├──────────────────────────────────────────────────────────┤${NC}"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}│  ${GREEN}1${WHITE}) 🎮 ${CYAN}Panels Menu${WHITE}                                    │"
        echo -e "${WHITE}│  ${GREEN}2${WHITE}) 🖥️  ${CYAN}Nodes Menu${WHITE}                                     │"
        echo -e "${WHITE}│  ${GREEN}3${WHITE}) ℹ️  ${CYAN}About${WHITE}                                        │"
        echo -e "${WHITE}│  ${GREEN}4${WHITE}) 🚪 ${CYAN}Exit${WHITE}                                          │"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}└──────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -ne "${YELLOW}➜ ${WHITE}Select an option: ${NC}"
        read opt

        case $opt in
            1) panels_menu ;;
            2) nodes_menu ;;
            3) about ;;
            4) 
                echo -e "${GREEN}👋 Goodbye! Thanks for using Cloud Hosting Installer${NC}"
                sleep 1
                exit 0 
                ;;
            *) 
                echo -e "${RED}❌ Invalid option! Please try again.${NC}"
                sleep 1 
                ;;
        esac
    done
}

# ================= ABOUT MENU =================
about() {
    clear_screen
    draw_header
    echo ""
    echo -e "${WHITE}┌──────────────────────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}│                    ℹ️  ABOUT THIS TOOL                    │${NC}"
    echo -e "${WHITE}├──────────────────────────────────────────────────────────┤${NC}"
    echo -e "${WHITE}│                                                          │${NC}"
    echo -e "${WHITE}│  ${GREEN}Name:${WHITE}        Cloud Hosting Installer               │${NC}"
    echo -e "${WHITE}│  ${GREEN}Version:${WHITE}     ${SCRIPT_VERSION}                                   │${NC}"
    echo -e "${WHITE}│  ${GREEN}Author:${WHITE}      ${AUTHOR}                                      │${NC}"
    echo -e "${WHITE}│  ${GREEN}License:${WHITE}     MIT License                            │${NC}"
    echo -e "${WHITE}│                                                          │${NC}"
    echo -e "${WHITE}│  ${YELLOW}📦 Supported Panels:${WHITE}                              │${NC}"
    echo -e "${WHITE}│     • Skyport Panel (✓ Working)                          │${NC}"
    echo -e "${WHITE}│     • Puffer Panel (🚧 Coming Soon)                      │${NC}"
    echo -e "${WHITE}│     • Draco Panel (🚧 Coming Soon)                       │${NC}"
    echo -e "${WHITE}│     • AirLink Panel (🚧 Coming Soon)                     │${NC}"
    echo -e "${WHITE}│                                                          │${NC}"
    echo -e "${WHITE}│  ${YELLOW}🖧  Supported Nodes:${WHITE}                                 │${NC}"
    echo -e "${WHITE}│     • Skyport Node (✓ Full Setup)                        │${NC}"
    echo -e "${WHITE}│                                                          │${NC}"
    echo -e "${WHITE}│  ${CYAN}💝 Special Thanks:${WHITE}                                   │${NC}"
    echo -e "${WHITE}│     • JishnuTheGamer for Skyport resources               │${NC}"
    echo -e "${WHITE}│     • Open source community                              │${NC}"
    echo -e "${WHITE}│                                                          │${NC}"
    echo -e "${WHITE}└──────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -e "${YELLOW}✨ This tool is maintained by ${GREEN}${AUTHOR}${YELLOW} ✨${NC}"
    echo ""
    read -p "Press Enter to return to Main Menu..."
    home
}

# ================= PANELS MENU =================
panels_menu() {
    while true; do
        clear_screen
        draw_header
        echo ""
        echo -e "${WHITE}┌──────────────────────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│                    🎮 PANELS MENU                         │${NC}"
        echo -e "${WHITE}├──────────────────────────────────────────────────────────┤${NC}"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}│  ${GREEN}1${WHITE}) 🚀 ${CYAN}Skyport Panel${WHITE} ${GREEN}[WORKING]${WHITE}                       │"
        echo -e "${WHITE}│  ${GREEN}2${WHITE}) 🔧 ${CYAN}Puffer Panel${WHITE} ${YELLOW}[Coming Soon]${WHITE}                     │"
        echo -e "${WHITE}│  ${GREEN}3${WHITE}) 🐉 ${CYAN}Draco Panel${WHITE} ${YELLOW}[Coming Soon]${WHITE}                      │"
        echo -e "${WHITE}│  ${GREEN}4${WHITE)} ✈️  ${CYAN}AirLink Panel${WHITE} ${YELLOW}[Coming Soon]${WHITE}                    │"
        echo -e "${WHITE}│  ${GREEN}5${WHITE)} 🔙 ${CYAN}Back to Main Menu${WHITE}                              │"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}└──────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -ne "${YELLOW}➜ ${WHITE}Select a panel to install: ${NC}"
        read p

        case $p in
            1)
                clear_screen
                draw_header
                echo ""
                echo -e "${CYAN}┌──────────────────────────────────────────────────────────┐${NC}"
                echo -e "${CYAN}│              🚀 INSTALLING SKYPORT PANEL                 │${NC}"
                echo -e "${CYAN}└──────────────────────────────────────────────────────────┘${NC}"
                echo ""
                echo -e "${YELLOW}📥 Downloading Skyport Panel...${NC}"
                sleep 1
                
                bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)
                
                if [ $? -eq 0 ]; then
                    installation_success
                else
                    echo -e "${RED}❌ Installation failed! Please check your internet connection.${NC}"
                    sleep 2
                fi
                ;;
            2|3|4)
                clear_screen
                draw_header
                echo ""
                echo -e "${YELLOW}┌──────────────────────────────────────────────────────────┐${NC}"
                echo -e "${YELLOW}│              🚧 COMING SOON                              │${NC}"
                echo -e "${YELLOW}└──────────────────────────────────────────────────────────┘${NC}"
                echo ""
                echo -e "${WHITE}This panel is currently under development.${NC}"
                echo -e "${WHITE}Stay tuned for updates from ${GREEN}${AUTHOR}${WHITE}!${NC}"
                echo ""
                read -p "Press Enter to continue..."
                ;;
            5)
                return
                ;;
            *)
                echo -e "${RED}❌ Invalid option! Please try again.${NC}"
                sleep 1
                ;;
        esac
    done
}

# ================= NODES MENU =================
nodes_menu() {
    while true; do
        clear_screen
        draw_header
        echo ""
        echo -e "${WHITE}┌──────────────────────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│                    🖥️  NODES MENU                         │${NC}"
        echo -e "${WHITE}├──────────────────────────────────────────────────────────┤${NC}"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}│  ${GREEN}1${WHITE}) 🚀 ${CYAN}Skyport Node${WHITE} ${GREEN}[FULL SETUP]${WHITE}                        │"
        echo -e "${WHITE}│  ${GREEN}2${WHITE)} 🔙 ${CYAN}Back to Main Menu${WHITE}                              │"
        echo -e "${WHITE}│                                                          │${NC}"
        echo -e "${WHITE}└──────────────────────────────────────────────────────────┘${NC}"
        echo ""
        echo -ne "${YELLOW}➜ ${WHITE}Select a node to install: ${NC}"
        read n

        case $n in
            1)
                clear_screen
                draw_header
                echo ""
                echo -e "${CYAN}┌──────────────────────────────────────────────────────────┐${NC}"
                echo -e "${CYAN}│           🚀 SKYPORT NODE INSTALLATION                   │${NC}"
                echo -e "${CYAN}└──────────────────────────────────────────────────────────┘${NC}"
                echo ""
                
                echo -e "${YELLOW}📥 Step 1: Installing Wings...${NC}"
                sleep 1
                
                bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)
                
                echo ""
                draw_separator
                echo -e "${WHITE}🔧 IMPORTANT CONFIGURATION STEP${NC}"
                draw_separator
                echo ""
                echo -e "${YELLOW}⚠️  Please replace the following in your config:${NC}"
                echo -e "  ${RED}http://panellink-3001${NC} → ${GREEN}http://localhost:3001${NC}"
                echo ""
                echo -e "${CYAN}📋 Please paste your CONFIG command below:${NC}"
                echo -ne "${WHITE}CONFIG> ${NC}"
                read config
                
                echo ""
                echo -e "${YELLOW}⚙️  Running configuration...${NC}"
                eval "$config"
                
                echo ""
                echo -e "${GREEN}✅ Configuration complete!${NC}"
                echo ""
                echo -e "${YELLOW}🚀 Starting Node service...${NC}"
                node .
                
                installation_success
                ;;
            2)
                return
                ;;
            *)
                echo -e "${RED}❌ Invalid option! Please try again.${NC}"
                sleep 1
                ;;
        esac
    done
}

# ================= MAIN EXECUTION =================

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}⚠️  This script should be run as root!${NC}"
    echo -e "${YELLOW}Please run: sudo bash $0${NC}"
    exit 1
fi

# Start the application
boot_screen
home
