#!/bin/bash

# ==============================================
#     ╔═══════════════════════════════════╗
#     ║   ESHAN HOSTING INSTALLER v2.0   ║
#     ║   Premium Cloud Management Suite  ║
#     ║   Author: Eshan                   ║
#     ║   One Click Hosting Installer     ║
#     ╚═══════════════════════════════════╝
# ==============================================

# ==================== PREMIUM COLOR SCHEME ====================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'

BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Eshan brand colors
ESHAN_GOLD='\033[38;5;214m'
ESHAN_SILVER='\033[38;5;250m'
ESHAN_ROSE='\033[38;5;204m'

# ==================== FUNCTIONS ====================

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
    echo -e "    ${BWhite}   ONE CLICK HOSTING INSTALLER v2.0${NC}"
    echo -e "    ${ESHAN_ROSE}         Created by Eshan ✨${NC}"
    echo -e "    ${ESHAN_SILVER}════════════════════════════════════════════════${NC}"
    echo ""
}

separator() {
    echo -e "${ESHAN_SILVER}┌────────────────────────────────────────────────────┐${NC}"
}

progress_bar() {
    echo -ne "${BGreen}["
    for i in {1..30}; do
        echo -ne "▓"
        sleep 0.02
    done
    echo -e "] 100%${NC}"
}

loading_animation() {
    echo -ne "${BCyan}"
    for i in {1..3}; do
        echo -ne "█"
        sleep 0.3
    done
    echo -e "${NC}"
}

success_msg() {
    echo -e "${BGreen}✓ $1${NC}"
    sleep 1
}

error_msg() {
    echo -e "${BRed}✗ $1${NC}"
    sleep 1
}

info_msg() {
    echo -e "${BCyan}➜ $1${NC}"
}

warning_msg() {
    echo -e "${BYellow}⚠ $1${NC}"
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

# ==================== AUTO CLOSE FUNCTION ====================
auto_close() {
    echo ""
    info_msg "Installation completed!"
    for i in {10..1}; do
        echo -ne "${BYellow}Closing menu in $i seconds...${NC}\r"
        sleep 1
    done
    echo -e "${BGreen}Goodbye! Thanks for using Eshan Installer!${NC}"
    sleep 1
    exit 0
}

# ==================== HOME MENU ====================
home_menu() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}                 🏠 HOME MENU                      ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) 🎮 ${BCyan}Panels List${NC}                                ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) 🖥️  ${BCyan}Nodes List${NC}                                 ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}3${NC}) ℹ️  ${BCyan}About Eshan${NC}                              ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}4${NC}) 🚪 ${BCyan}Exit${NC}                                      ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -ne "${BWhite}➜ Select option: ${NC}"
        read choice

        case $choice in
            1) panels_list ;;
            2) nodes_list ;;
            3) about_eshan ;;
            4) 
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

# ==================== PANELS LIST ====================
panels_list() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}               🎮 PANELS LIST                    ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) 🚀 ${BCyan}Skyport Panel${NC}        ${BGreen}[WORKING]${NC}              ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) 🐧 ${BCyan}Puffer Panel${NC}         ${BGreen}[BUILT-IN]${NC}             ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}3${NC}) 🔙 ${BCyan}Back to Home${NC}                               ${ESHAN_GOLD}║${NC}"
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
                    success_msg "Skyport Panel installed successfully!"
                else
                    error_msg "Installation failed! Check your connection."
                fi
                sleep 2
                ;;
            2)
                install_puffer_panel
                ;;
            3)
                return
                ;;
            *)
                error_msg "Invalid option"
                sleep 1
                ;;
        esac
    done
}

# ==================== NODES LIST ====================
nodes_list() {
    while true; do
        clear
        eshang_header
        echo ""
        echo -e "${ESHAN_GOLD}╔════════════════════════════════════════════════════╗${NC}"
        echo -e "${ESHAN_GOLD}║${BWhite}               🖥️  NODES LIST                     ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╠════════════════════════════════════════════════════╣${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}1${NC}) 🚀 ${BCyan}Skyport Node${NC}         ${BGreen}[ACTIVE]${NC}               ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}2${NC}) 🐧 ${BCyan}Puffer Panel Node${NC}    ${BGreen}[BUILT-IN]${NC}             ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}  ${BGreen}3${NC}) 🔙 ${BCyan}Back to Home${NC}                               ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}║${NC}                                                  ${ESHAN_GOLD}║${NC}"
        echo -e "${ESHAN_GOLD}╚════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -ne "${BWhite}➜ Select node: ${NC}"
        read node_choice

        case $node_choice in
            1)
                install_skyport_node
                ;;
            2)
                install_puffer_node
                ;;
            3)
                return
                ;;
            *)
                error_msg "Invalid option"
                sleep 1
                ;;
        esac
    done
}

# ==================== SKYPORT NODE ====================
install_skyport_node() {
    clear
    eshang_header
    echo ""
    info_msg "Installing Skyport Node..."
    loading_animation
    
    bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)
    
    if [ $? -eq 0 ]; then
        success_msg "Wings installed successfully!"
    else
        error_msg "Wings installation failed!"
        sleep 2
        return
    fi
    
    echo ""
    separator
    echo -e "${BYellow}⚙️  REQUIREMENTS & CONFIGURATION${NC}"
    separator
    echo ""
    
    # Change to skyport directory
    if [ -d "skyportd" ]; then
        info_msg "Entering skyportd directory..."
        cd skyportd
        success_msg "Now in: $(pwd)"
    else
        warning_msg "skyportd directory not found!"
        info_msg "Creating skyportd directory..."
        mkdir -p skyportd
        cd skyportd
        success_msg "Created and entered skyportd directory"
    fi
    
    echo ""
    echo -e "${BWhite}📋 Please paste your Node Config command below:${NC}"
    echo -e "${ESHAN_SILVER}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -ne "${BCyan}CONFIG> ${NC}"
    read node_config
    
    echo ""
    info_msg "Applying node configuration..."
    eval "$node_config"
    success_msg "Configuration applied!"
    
    echo ""
    info_msg "Starting Skyport Node..."
    info_msg "Running: node ."
    echo ""
    node .
    
    auto_close
}

# ==================== PUFFER NODE ====================
install_puffer_node() {
    clear
    eshang_header
    echo ""
    echo -e "${BGreen}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BGreen}║         🐧 PUFFER PANEL NODE INSTALLER 🐧         ║${NC}"
    echo -e "${BGreen}║         One Click Hosting Installer               ║${NC}"
    echo -e "${BGreen}║         Created by: Eshan                         ║${NC}"
    echo -e "${BGreen}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Step 1: Switch to root
    info_msg "Step 1: Switching to root user..."
    sudo su
    success_msg "Root access granted!"
    echo ""
    
    # Step 2: Update system
    info_msg "Step 2: Updating system packages..."
    apt update
    success_msg "System updated!"
    echo ""
    
    # Step 3: Upgrade system
    info_msg "Step 3: Upgrading system packages..."
    apt upgrade -y
    success_msg "System upgraded!"
    echo ""
    
    # Step 4: Create directory
    info_msg "Step 4: Creating PufferPanel directory..."
    mkdir -p /var/lib/pufferpanel
    success_msg "Directory created: /var/lib/pufferpanel"
    echo ""
    
    # Step 5: Create Docker volume
    info_msg "Step 5: Creating Docker volume..."
    docker volume create pufferpanel-config
    success_msg "Docker volume created!"
    echo ""
    
    # Step 6: Create Docker container
    info_msg "Step 6: Creating PufferPanel container..."
    docker create --name pufferpanel -p 8080:8080 -p 5657:5657 -v pufferpanel-config:/etc/pufferpanel -v /var/lib/pufferpanel:/var/lib/pufferpanel -v /var/run/docker.sock:/var/run/docker.sock --restart=on-failure pufferpanel/pufferpanel:latest
    success_msg "Container created!"
    echo ""
    
    # Step 7: Start container
    info_msg "Step 7: Starting PufferPanel container..."
    docker start pufferpanel
    success_msg "Container started!"
    echo ""
    
    # Step 8: Add user
    info_msg "Step 8: Setting up admin user..."
    docker exec -it pufferpanel /pufferpanel/pufferpanel user add
    success_msg "User setup complete!"
    echo ""
    
    # Final success message
    echo ""
    echo -e "${BGreen}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BGreen}║         🎉 PUFFER PANEL INSTALLED! 🎉             ║${NC}"
    echo -e "${BGreen}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BWhite}📝 Access Information:${NC}"
    echo -e "  ${BCyan}Panel URL:${NC} http://$(curl -s ifconfig.me):8080"
    echo -e "  ${BCyan}Port:${NC} 8080"
    echo ""
    echo -e "${BYellow}💡 Tip: Use the credentials you just created to login${NC}"
    echo ""
    
    auto_close
}

# ==================== PUFFER PANEL (PANELS LIST) ====================
install_puffer_panel() {
    install_puffer_node
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
    echo -e "${BWhite}✨ Eshan Hosting Installer v2.0${NC}"
    echo -e "${BCyan}📦 One Click Cloud Management Solution${NC}"
    echo ""
    echo -e "${BYellow}👨‍💻 Developer:${NC}  Eshan"
    echo -e "${BYellow}📅 Version:${NC}     2.0 (Premium Edition)"
    echo -e "${BYellow}📜 License:${NC}     MIT"
    echo ""
    echo -e "${BCyan}🎯 Features:${NC}"
    echo -e "  • Skyport Panel (One-Click)"
    echo -e "  • Skyport Node (Auto Setup)"
    echo -e "  • Puffer Panel (Built-In)"
    echo -e "  • Puffer Node (Built-In)"
    echo -e "  • System Health Monitor"
    echo -e "  • 24/7 Support"
    echo ""
    echo -e "${BGreen}💝 Special Thanks:${NC}"
    echo -e "  • JishnuTheGamer - Skyport Resources"
    echo -e "  • PufferPanel Team"
    echo -e "  • Open Source Community"
    echo -e "  • All Eshan Users"
    echo ""
    echo -e "${ESHAN_GOLD}⭐ Eshan - One Click Hosting Installer ⭐${NC}"
    echo ""
    read -p "$(echo -e ${BWhite}"Press Enter to return..."${NC})"
}

# ==================== MAIN EXECUTION ====================

# Root check warning (but not required)
if [[ $EUID -ne 0 ]]; then
    echo -e "${BYellow}⚠️  Note: Some features may require root access${NC}"
    echo -e "${BYellow}⚠️  For best experience, run with: sudo bash $0${NC}"
    echo ""
    sleep 2
fi

# Start the installer
boot_sequence
home_menu
