#!/usr/bin/env bash

# ===================================================
#        ESHAN VPS STATUS CHECKER v1.0
#        System Health & Compatibility Monitor
# ===================================================
#  Created by: Eshan
#  "Just the facts, no installations"
# ===================================================

# ==================== COLOR SCHEME ====================
RESET="\e[0m"
BOLD="\e[1m"
RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
BLUE="\e[94m"
CYAN="\e[96m"
WHITE="\e[97m"
NEON_GREEN="\e[38;5;82m"
NEON_PURPLE="\e[38;5;165m"
NEON_BLUE="\e[38;5;75m"
GOLD="\e[38;5;220m"
DANGER="\e[38;5;196m"

clear

# ==================== HEADER ====================
echo -e "${GOLD}"
cat << "EOF"
    ███████╗███████╗██╗  ██╗ █████╗ ███╗   ██╗
    ██╔════╝██╔════╝██║  ██║██╔══██╗████╗  ██║
    ███████╗███████╗███████║███████║██╔██╗ ██║
    ╚════██║╚════██║██╔══██║██╔══██║██║╚██╗██║
    ███████║███████║██║  ██║██║  ██║██║ ╚████║
    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
EOF
echo -e "${NEON_PURPLE}${BOLD}           VPS STATUS CHECKER v1.0${RESET}"
echo -e "${NEON_BLUE}        System Health & Compatibility Monitor${RESET}"
echo -e "${DIM}              Created by: ${BOLD}Eshan${RESET}"
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}\n"

# ==================== FUNCTIONS ====================
print_working() {
    echo -e "  ${GREEN}✅ WORKING${RESET} - $1"
}

print_not_working() {
    echo -e "  ${RED}❌ NOT WORKING${RESET} - $1"
}

print_status() {
    echo -e "  ${CYAN}📊 $1:${RESET} $2"
}

print_section() {
    echo -e "\n${GOLD}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${WHITE}${BOLD}  $1${RESET}"
    echo -e "${GOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
}

# ==================== SYSTEM STATUS ====================
print_section "🖥️  SYSTEM STATUS"

# Operating System
if [ -f /etc/os-release ]; then
    . /etc/os-release
    print_status "OS" "$PRETTY_NAME"
else
    print_status "OS" "$(uname -s)"
fi

# Kernel
print_status "Kernel" "$(uname -r)"

# Architecture
print_status "Architecture" "$(uname -m)"

# Hostname
print_status "Hostname" "$(hostname)"

# Uptime
uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
uptime_days=$((uptime_seconds / 86400))
uptime_hours=$(((uptime_seconds % 86400) / 3600))
print_status "Uptime" "${uptime_days}d ${uptime_hours}h"

# ==================== SYSTEMD CHECK ====================
print_section "🔧 SYSTEMD COMPATIBILITY"

if pidof systemd >/dev/null 2>&1 || [ -d /run/systemd/system ]; then
    print_working "Systemd is supported"
    systemd_version=$(systemd --version 2>/dev/null | head -1 | awk '{print $2}')
    echo -e "  ${CYAN}   Version:${RESET} $systemd_version"
else
    print_not_working "Systemd is NOT supported (using SysV init)"
fi

# ==================== DOCKER CHECK ====================
print_section "🐳 DOCKER SUPPORT"

if command -v docker >/dev/null 2>&1; then
    print_working "Docker is installed"
    docker_version=$(docker --version 2>/dev/null | awk '{print $3}' | sed 's/,//')
    echo -e "  ${CYAN}   Version:${RESET} $docker_version"
    
    # Check if Docker daemon is running
    if docker ps >/dev/null 2>&1; then
        echo -e "  ${GREEN}   Daemon: RUNNING${RESET}"
        containers=$(docker ps -q 2>/dev/null | wc -l)
        echo -e "  ${CYAN}   Containers running:${RESET} $containers"
    else
        echo -e "  ${RED}   Daemon: NOT RUNNING${RESET}"
    fi
else
    print_not_working "Docker is NOT installed"
fi

# ==================== CPU STATUS ====================
print_section "💻 CPU STATUS"

if [ -f /proc/cpuinfo ]; then
    cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | sed 's/^ //')
    cpu_cores=$(grep -c "processor" /proc/cpuinfo)
    print_status "Model" "$cpu_model"
    print_status "Cores" "$cpu_cores"
    
    # CPU Usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    if [ -n "$cpu_usage" ]; then
        if (( $(echo "$cpu_usage > 80" | bc -l) )); then
            echo -e "  ${RED}⚠️  Usage: ${cpu_usage}% (HIGH)${RESET}"
        elif (( $(echo "$cpu_usage > 50" | bc -l) )); then
            echo -e "  ${YELLOW}⚠️  Usage: ${cpu_usage}% (MEDIUM)${RESET}"
        else
            echo -e "  ${GREEN}✅ Usage: ${cpu_usage}% (NORMAL)${RESET}"
        fi
    fi
fi

# ==================== MEMORY STATUS ====================
print_section "🧠 MEMORY STATUS"

mem_total=$(free -h | awk '/^Mem:/ {print $2}')
mem_used=$(free -h | awk '/^Mem:/ {print $3}')
mem_free=$(free -h | awk '/^Mem:/ {print $4}')
mem_percent=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2 * 100}')

print_status "Total RAM" "$mem_total"
print_status "Used RAM" "$mem_used"
print_status "Free RAM" "$mem_free"

if (( $(echo "$mem_percent > 80" | bc -l) )); then
    echo -e "  ${RED}⚠️  Usage: ${mem_percent}% (CRITICAL)${RESET}"
elif (( $(echo "$mem_percent > 60" | bc -l) )); then
    echo -e "  ${YELLOW}⚠️  Usage: ${mem_percent}% (HIGH)${RESET}"
else
    echo -e "  ${GREEN}✅ Usage: ${mem_percent}% (NORMAL)${RESET}"
fi

# Swap
swap_total=$(free -h | awk '/^Swap:/ {print $2}')
if [ "$swap_total" != "0B" ] && [ -n "$swap_total" ]; then
    swap_used=$(free -h | awk '/^Swap:/ {print $3}')
    print_status "Swap Total" "$swap_total"
    print_status "Swap Used" "$swap_used"
else
    echo -e "  ${YELLOW}⚠️  No swap space configured${RESET}"
fi

# ==================== DISK STATUS ====================
print_section "💾 DISK STATUS"

df -h | grep -E '^/dev/' | while read line; do
    mount=$(echo $line | awk '{print $6}')
    size=$(echo $line | awk '{print $2}')
    used=$(echo $line | awk '{print $3}')
    available=$(echo $line | awk '{print $4}')
    use_percent=$(echo $line | awk '{print $5}' | sed 's/%//')
    
    if [ ${use_percent:-0} -gt 85 ]; then
        echo -e "  ${RED}⚠️  $mount: $used/$size (${use_percent}% used) - CRITICAL${RESET}"
    elif [ ${use_percent:-0} -gt 70 ]; then
        echo -e "  ${YELLOW}⚠️  $mount: $used/$size (${use_percent}% used)${RESET}"
    else
        echo -e "  ${GREEN}✅ $mount: $used/$size (${use_percent}% used)${RESET}"
    fi
done

# ==================== NETWORK STATUS ====================
print_section "🌐 NETWORK STATUS"

# Public IP
public_ip=$(curl -s --max-time 3 ifconfig.me 2>/dev/null)
if [ -n "$public_ip" ]; then
    print_status "Public IP" "$public_ip"
else
    echo -e "  ${RED}❌ Public IP: Unable to fetch${RESET}"
fi

# Private IP
private_ip=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -1)
if [ -n "$private_ip" ]; then
    print_status "Private IP" "$private_ip"
else
    echo -e "  ${RED}❌ Private IP: Not found${RESET}"
fi

# Network Interfaces
echo -e "\n  ${CYAN}📡 Network Interfaces:${RESET}"
ip -br link show | grep -v "lo" | while read line; do
    interface=$(echo $line | awk '{print $1}')
    state=$(echo $line | awk '{print $2}')
    if [ "$state" == "UP" ]; then
        echo -e "     ${GREEN}✅ $interface: $state${RESET}"
    else
        echo -e "     ${RED}❌ $interface: $state${RESET}"
    fi
done

# ==================== PORT STATUS ====================
print_section "🔌 PORT STATUS"

common_ports="22 80 443 8080 3000 3306"
for port in $common_ports; do
    if ss -tln | grep -q ":$port "; then
        service_name=$(ss -tlnp 2>/dev/null | grep ":$port " | head -1 | awk -F'"' '{print $2}')
        if [ -n "$service_name" ]; then
            echo -e "  ${GREEN}✅ Port $port: OPEN${RESET} ($service_name)"
        else
            echo -e "  ${GREEN}✅ Port $port: OPEN${RESET}"
        fi
    else
        echo -e "  ${DIM}❌ Port $port: CLOSED${RESET}"
    fi
done

# ==================== SERVICE STATUS ====================
print_section "🔄 SERVICE STATUS"

check_service() {
    local service=$1
    local name=$2
    
    if systemctl is-active --quiet $service 2>/dev/null; then
        echo -e "  ${GREEN}✅ $name: RUNNING${RESET}"
    elif pgrep -x "$service" >/dev/null 2>&1; then
        echo -e "  ${GREEN}✅ $name: RUNNING${RESET} (process)"
    else
        echo -e "  ${RED}❌ $name: NOT RUNNING${RESET}"
    fi
}

check_service "nginx" "Nginx"
check_service "apache2" "Apache"
check_service "mysql" "MySQL/MariaDB"
check_service "docker" "Docker Daemon"
check_service "redis-server" "Redis"
check_service "node" "Node.js"

# ==================== SOFTWARE STATUS ====================
print_section "📦 SOFTWARE STATUS"

check_software() {
    local cmd=$1
    local name=$2
    
    if command -v $cmd >/dev/null 2>&1; then
        version=$($cmd --version 2>/dev/null | head -1 | cut -d' ' -f2- | cut -c1-30)
        echo -e "  ${GREEN}✅ $name: INSTALLED${RESET} ($version)"
    else
        echo -e "  ${RED}❌ $name: NOT INSTALLED${RESET}"
    fi
}

check_software "node" "Node.js"
check_software "npm" "NPM"
check_software "python3" "Python 3"
check_software "git" "Git"
check_software "curl" "Curl"
check_software "wget" "Wget"
check_software "docker-compose" "Docker Compose"
check_software "java" "Java"

# ==================== SECURITY STATUS ====================
print_section "🔒 SECURITY STATUS"

# Firewall
if command -v ufw >/dev/null 2>&1; then
    if ufw status | grep -q "active"; then
        echo -e "  ${GREEN}✅ UFW Firewall: ACTIVE${RESET}"
    else
        echo -e "  ${RED}❌ UFW Firewall: INACTIVE${RESET}"
    fi
elif command -v iptables >/dev/null 2>&1; then
    echo -e "  ${GREEN}✅ IPTables: CONFIGURED${RESET}"
else
    echo -e "  ${RED}❌ Firewall: NOT CONFIGURED${RESET}"
fi

# SSH Root Login
if [ -f /etc/ssh/sshd_config ]; then
    if grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config 2>/dev/null; then
        echo -e "  ${RED}❌ SSH Root Login: ENABLED (Security Risk)${RESET}"
    else
        echo -e "  ${GREEN}✅ SSH Root Login: DISABLED${RESET}"
    fi
fi

# ==================== SUMMARY ====================
print_section "📊 SUMMARY"

# Count working vs not working
working_count=0
not_working_count=0

# Systemd
if pidof systemd >/dev/null 2>&1; then
    ((working_count++))
else
    ((not_working_count++))
fi

# Docker
if command -v docker >/dev/null 2>&1; then
    ((working_count++))
else
    ((not_working_count++))
fi

# Memory
mem_percent_int=${mem_percent%.*}
if [ "${mem_percent_int:-0}" -lt 80 ]; then
    ((working_count++))
else
    ((not_working_count++))
fi

# Disk
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "${disk_usage:-0}" -lt 85 ]; then
    ((working_count++))
else
    ((not_working_count++))
fi

# Overall Status
echo -e "  ${CYAN}📊 System Components Working: ${working_count}/${working_count+not_working_count}${RESET}"
echo -e "  ${CYAN}⚠️  Issues Detected: ${not_working_count}${RESET}"

if [ $not_working_count -eq 0 ]; then
    echo -e "  ${NEON_GREEN}${BOLD}✓ OVERALL STATUS: EXCELLENT${RESET}"
elif [ $not_working_count -le 2 ]; then
    echo -e "  ${YELLOW}${BOLD}⚠ OVERALL STATUS: GOOD (Minor issues)${RESET}"
else
    echo -e "  ${RED}${BOLD}✗ OVERALL STATUS: POOR (Needs attention)${RESET}"
fi

# ==================== FOOTER ====================
echo ""
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}"
echo -e "${NEON_PURPLE}${BOLD}              ESHAN VPS STATUS CHECKER${RESET}"
echo -e "${NEON_BLUE}              Checked on: $(date)${RESET}"
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}\n"

read -p "$(echo -e ${WHITE}"Press Enter to exit..."${RESET})"
exit 0
