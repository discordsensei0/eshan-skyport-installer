#!/usr/bin/env bash

# ===================================================
#        ESHAN VPS STATUS CHECKER
#        Fastfetch Style - Clean & Minimal
# ===================================================
#  Created by: Eshan
# ===================================================

# Colors
RESET='\033[0m'
BOLD='\033[1m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
GRAY='\033[90m'

clear

# Logo and Info
echo -e "${CYAN}${BOLD}"
echo "    ╭─────────────────────────────────────────────────╮"
echo "    │              ESHAN VPS STATUS                   │"
echo "    ╰─────────────────────────────────────────────────╯"
echo -e "${NC}"

# OS
echo -e "${GREEN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${WHITE}    ${CYAN}OS:${NC}           $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'"' -f2 || echo "Unknown")"
echo -e "${WHITE}    ${CYAN}Shell:${NC}        $(basename $SHELL)"
echo -e "${WHITE}    ${CYAN}User:${NC}         $(whoami)@$(hostname)"
echo -e "${WHITE}    ${CYAN}Uptime:${NC}       $(uptime -p | sed 's/up //')"
echo -e "${WHITE}    ${CYAN}Kernel:${NC}       $(uname -r)"
echo -e "${WHITE}    ${CYAN}Arch:${NC}         $(uname -m)"

# Systemd
if pidof systemd >/dev/null 2>&1; then
    echo -e "${WHITE}    ${CYAN}Systemd:${NC}      ${GREEN}✓ Working${NC} (v$(systemd --version | head -1 | awk '{print $2}'))"
else
    echo -e "${WHITE}    ${CYAN}Systemd:${NC}      ${RED}✗ Not Working${NC}"
fi

# Docker
if command -v docker >/dev/null 2>&1; then
    DOCKER_VERSION=$(docker --version | awk '{print $3}' | sed 's/,//')
    if docker ps >/dev/null 2>&1; then
        echo -e "${WHITE}    ${CYAN}Docker:${NC}       ${GREEN}✓ Working${NC} (v$DOCKER_VERSION, daemon: running)"
    else
        echo -e "${WHITE}    ${CYAN}Docker:${NC}       ${YELLOW}◉ Installed${NC} (v$DOCKER_VERSION, daemon: stopped)"
    fi
else
    echo -e "${WHITE}    ${CYAN}Docker:${NC}       ${RED}✗ Not installed${NC}"
fi

echo -e "${GREEN}├─────────────────────────────────────────────────┤${NC}"

# CPU
CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | sed 's/^ //' | cut -c1-40)
CPU_CORES=$(nproc)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo -e "${WHITE}    ${CYAN}CPU:${NC}          $CPU_MODEL"
echo -e "${WHITE}     ${CYAN}Cores:${NC}        $CPU_CORES @ ${CPU_USAGE}%"

# RAM
MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/^Mem:/ {print $3}')
MEM_PERCENT=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2 * 100}')
echo -e "${WHITE}    ${CYAN}RAM:${NC}          $MEM_USED / $MEM_TOTAL (${MEM_PERCENT}%)"

# Disk
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_PERCENT=$(df / | awk 'NR==2 {print $5}')
echo -e "${WHITE}    ${CYAN}Disk (/):${NC}      $DISK_USED / $DISK_TOTAL ($DISK_PERCENT)"

echo -e "${GREEN}├─────────────────────────────────────────────────┤${NC}"

# IP Addresses
PUBLIC_IP=$(curl -s --max-time 3 ifconfig.me 2>/dev/null || echo "Unavailable")
PRIVATE_IP=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -1)
echo -e "${WHITE}    ${CYAN}Public IP:${NC}     $PUBLIC_IP"
echo -e "${WHITE}     ${CYAN}Private IP:${NC}    ${PRIVATE_IP:-Not found}"

# Open Ports
OPEN_PORTS=""
for port in 22 80 443 8080 3000; do
    if ss -tln | grep -q ":$port "; then
        OPEN_PORTS="$OPEN_PORTS $port"
    fi
done
echo -e "${WHITE}    ${CYAN}Open Ports:${NC}   ${OPEN_PORTS:-None}"

echo -e "${GREEN}├─────────────────────────────────────────────────┤${NC}"

# Key Services
echo -e "${WHITE}    ${CYAN}Services:${NC}"
for service in nginx apache2 mysql docker redis node; do
    if systemctl is-active --quiet $service 2>/dev/null; then
        echo -e "     ${GREEN}✓ $service running${NC}"
    elif pgrep -x "$service" >/dev/null 2>&1; then
        echo -e "     ${GREEN}✓ $service running${NC}"
    fi
done

# Key Software
echo -e "${WHITE}  󰏗  ${CYAN}Software:${NC}"
for cmd in node npm python3 git docker-compose; do
    if command -v $cmd >/dev/null 2>&1; then
        VERSION=$($cmd --version 2>/dev/null | head -1 | cut -d' ' -f2 | cut -c1-10)
        echo -e "     ${GREEN}✓ $cmd${NC} ($VERSION)"
    fi
done

echo -e "${GREEN}└─────────────────────────────────────────────────┘${NC}"

# Footer
echo -e "\n${GRAY}  Created by: Eshan | One Click Hosting Installer${NC}"
echo ""
