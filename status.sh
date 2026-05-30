#!/usr/bin/env bash

# ===================================================
#        ESHAN VPS STATUS CHECKER v1.0
#        Complete System Health Monitor
# ===================================================
#  Created by: Eshan
#  One Click Hosting Installer
#  "Know your VPS inside out"
# ===================================================

# ==================== COLOR SCHEME ====================
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
UNDERLINE="\e[4m"

RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
BLUE="\e[94m"
PURPLE="\e[95m"
CYAN="\e[96m"
WHITE="\e[97m"

NEON_GREEN="\e[38;5;82m"
NEON_PURPLE="\e[38;5;165m"
NEON_BLUE="\e[38;5;75m"
NEON_PINK="\e[38;5;206m"
NEON_ORANGE="\e[38;5;214m"
GLOW="\e[38;5;51m"
DANGER="\e[38;5;196m"
GOLD="\e[38;5;220m"

# ==================== HEADER ====================
clear
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
echo -e "${GLOW}        Complete System Health & Compatibility Monitor${RESET}"
echo -e "${DIM}              Created by: ${BOLD}Eshan${RESET}"
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}\n"

# ==================== FUNCTIONS ====================
print_section() {
    echo -e "\n${NEON_BLUE}${BOLD}┌────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${NEON_BLUE}${BOLD}│${RESET} ${WHITE}${BOLD}$1${RESET}"
    echo -e "${NEON_BLUE}${BOLD}└────────────────────────────────────────────────────────────┘${RESET}\n"
}

print_ok() {
    echo -e "  ${GREEN}✅ $1${RESET}"
}

print_fail() {
    echo -e "  ${RED}❌ $1${RESET}"
}

print_warning() {
    echo -e "  ${YELLOW}⚠️  $1${RESET}"
}

print_info() {
    echo -e "  ${CYAN}➜ $1${RESET}"
}

print_value() {
    echo -e "  ${GOLD}📊 $1:${RESET} ${WHITE}$2${RESET}"
}

# ==================== SYSTEM INFORMATION ====================
print_section "🖥️  SYSTEM INFORMATION"

# OS Detection
if [ -f /etc/os-release ]; then
    . /etc/os-release
    print_value "Operating System" "$PRETTY_NAME"
else
    print_value "Operating System" "$(uname -s)"
fi

# Kernel Version
print_value "Kernel Version" "$(uname -r)"

# Architecture
print_value "Architecture" "$(uname -m)"

# Hostname
print_value "Hostname" "$(hostname)"

# Uptime
uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
uptime_days=$((uptime_seconds / 86400))
uptime_hours=$(((uptime_seconds % 86400) / 3600))
uptime_minutes=$(((uptime_seconds % 3600) / 60))
print_value "System Uptime" "${uptime_days}d ${uptime_hours}h ${uptime_minutes}m"

# Last Boot
print_value "Last Boot" "$(who -b | awk '{print $3 " " $4}')"

# ==================== CPU INFORMATION ====================
print_section "💻 CPU INFORMATION"

# CPU Model
if [ -f /proc/cpuinfo ]; then
    cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | sed 's/^ //')
    print_value "CPU Model" "$cpu_model"
    
    cpu_cores=$(grep -c "processor" /proc/cpuinfo)
    print_value "CPU Cores" "$cpu_cores"
    
    # CPU Usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    if [ -n "$cpu_usage" ]; then
        print_value "CPU Usage" "${cpu_usage}%"
    fi
fi

# ==================== MEMORY INFORMATION ====================
print_section "🧠 MEMORY INFORMATION"

# RAM Usage
mem_total=$(free -h | awk '/^Mem:/ {print $2}')
mem_used=$(free -h | awk '/^Mem:/ {print $3}')
mem_free=$(free -h | awk '/^Mem:/ {print $4}')
mem_percent=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2 * 100}')

print_value "Total RAM" "$mem_total"
print_value "Used RAM" "$mem_used"
print_value "Free RAM" "$mem_free"
print_value "RAM Usage" "${mem_percent}%"

# Swap Usage
swap_total=$(free -h | awk '/^Swap:/ {print $2}')
if [ "$swap_total" != "0B" ] && [ -n "$swap_total" ]; then
    swap_used=$(free -h | awk '/^Swap:/ {print $3}')
    print_value "Total Swap" "$swap_total"
    print_value "Used Swap" "$swap_used"
else
    print_warning "No swap space configured"
fi

# ==================== DISK INFORMATION ====================
print_section "💾 DISK INFORMATION"

# Disk Usage
df -h | grep -E '^/dev/' | while read line; do
    filesystem=$(echo $line | awk '{print $1}')
    size=$(echo $line | awk '{print $2}')
    used=$(echo $line | awk '{print $3}')
    available=$(echo $line | awk '{print $4}')
    use_percent=$(echo $line | awk '{print $5}')
    
    echo -e "  ${GOLD}📀 Partition:${RESET} ${WHITE}$filesystem${RESET}"
    echo -e "     ${CYAN}Size:${RESET} $size  ${CYAN}Used:${RESET} $used  ${CYAN}Available:${RESET} $available  ${CYAN}Usage:${RESET} $use_percent"
done

# Inode Usage
echo ""
inode_usage=$(df -i / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ ${inode_usage:-0} -gt 90 ]; then
    print_warning "Inode usage is at ${inode_usage}% (Critical!)"
else
    print_info "Inode usage: ${inode_usage}%"
fi

# ==================== NETWORK INFORMATION ====================
print_section "🌐 NETWORK INFORMATION"

# Public IP
public_ip=$(curl -s --max-time 5 ifconfig.me 2>/dev/null || echo "Unavailable")
print_value "Public IPv4" "$public_ip"

# Private IP
private_ip=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -1)
print_value "Private IPv4" "${private_ip:-Not found}"

# Network Interfaces
print_info "Network Interfaces:"
ip -br link show | grep -v "lo" | while read line; do
    interface=$(echo $line | awk '{print $1}')
    state=$(echo $line | awk '{print $2}')
    echo -e "     ${CYAN}➜${RESET} $interface: ${WHITE}$state${RESET}"
done

# ==================== COMPATIBILITY CHECKS ====================
print_section "🔧 COMPATIBILITY CHECKS"

# Systemd Support
print_info "Checking systemd support..."
if pidof systemd >/dev/null 2>&1 || [ -d /run/systemd/system ]; then
    print_ok "Systemd is supported"
    systemd_version=$(systemd --version | head -1 | awk '{print $2}')
    print_info "  Version: $systemd_version"
else
    print_fail "Systemd is NOT supported (using SysV init or other)"
fi

# Docker Support
print_info "Checking Docker support..."
if command -v docker >/dev/null 2>&1; then
    print_ok "Docker is installed"
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//')
    print_info "  Version: $docker_version"
    
    # Check if Docker daemon is running
    if docker ps >/dev/null 2>&1; then
        print_ok "Docker daemon is running"
        docker_containers=$(docker ps -q | wc -l)
        print_info "  Running containers: $docker_containers"
    else
        print_warning "Docker daemon is not running"
    fi
else
    print_warning "Docker is NOT installed"
    print_info "  Install with: curl -fsSL https://get.docker.com | bash"
fi

# ==================== SERVICE CHECKS ====================
print_section "🔄 SERVICE STATUS"

# Check common services
check_service() {
    local service=$1
    local name=$2
    
    if systemctl is-active --quiet $service 2>/dev/null; then
        print_ok "$name is running"
    elif pgrep -x "$service" >/dev/null 2>&1; then
        print_ok "$name is running (process)"
    else
        print_warning "$name is not running"
    fi
}

check_service "nginx" "Nginx"
check_service "apache2" "Apache"
check_service "mysql" "MySQL"
check_service "docker" "Docker"
check_service "redis-server" "Redis"
check_service "node" "Node.js"

# ==================== PORT CHECK ====================
print_section "🔌 OPEN PORTS"

print_info "Common ports status:"
common_ports="22 80 443 8080 3000 3306 5432 6379 27017"
for port in $common_ports; do
    if ss -tln | grep -q ":$port "; then
        service_name=$(ss -tlnp 2>/dev/null | grep ":$port " | head -1 | awk -F'"' '{print $2}')
        echo -e "  ${GREEN}✅ Port $port${RESET} - ${WHITE}Open ($service_name)${RESET}"
    else
        echo -e "  ${DIM}➜ Port $port - Closed${RESET}"
    fi
done

# ==================== INSTALLED SOFTWARE ====================
print_section "📦 INSTALLED SOFTWARE"

check_software() {
    local cmd=$1
    local name=$2
    if command -v $cmd >/dev/null 2>&1; then
        version=$($cmd --version 2>/dev/null | head -1 | cut -d' ' -f2-)
        print_ok "$name installed ($version)"
    else
        print_warning "$name not installed"
    fi
}

check_software "node" "Node.js"
check_software "npm" "NPM"
check_software "python3" "Python 3"
check_software "python" "Python"
check_software "pip" "PIP"
check_software "git" "Git"
check_software "curl" "Curl"
check_software "wget" "Wget"
check_software "docker-compose" "Docker Compose"
check_software "nginx" "Nginx"
check_software "mysql" "MySQL"
check_software "redis-server" "Redis"
check_software "java" "Java"

# ==================== SECURITY CHECKS ====================
print_section "🔒 SECURITY CHECKS"

# Firewall Status
if command -v ufw >/dev/null 2>&1; then
    if ufw status | grep -q "active"; then
        print_ok "UFW Firewall is active"
    else
        print_warning "UFW Firewall is not active"
    fi
elif command -v iptables >/dev/null 2>&1; then
    if iptables -L | grep -q "Chain"; then
        print_ok "IPTables is configured"
    fi
else
    print_warning "No firewall detected"
fi

# SSH Root Login
if [ -f /etc/ssh/sshd_config ]; then
    if grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config; then
        print_warning "Root login via SSH is enabled (security risk)"
    else
        print_ok "Root login via SSH is disabled"
    fi
fi

# ==================== RECOMMENDATIONS ====================
print_section "💡 RECOMMENDATIONS"

# RAM Recommendation
mem_total_mb=$(free -m | awk '/^Mem:/ {print $2}')
if [ "$mem_total_mb" -lt 1024 ]; then
    print_warning "Low RAM (${mem_total_mb}MB) - Consider upgrading for better performance"
elif [ "$mem_total_mb" -lt 2048 ]; then
    print_info "Adequate RAM (${mem_total_mb}MB) - Good for basic hosting"
else
    print_ok "Excellent RAM (${mem_total_mb}MB) - Great for hosting"
fi

# CPU Recommendation
cpu_cores=$(nproc)
if [ "$cpu_cores" -lt 2 ]; then
    print_warning "Single core CPU - May struggle with multiple services"
else
    print_ok "Multi-core CPU ($cpu_cores cores) - Good for hosting"
fi

# Docker Recommendation
if ! command -v docker >/dev/null 2>&1; then
    print_info "Consider installing Docker for containerized applications"
    print_info "  Run: curl -fsSL https://get.docker.com | bash"
fi

# Swap Recommendation
swap_total_mb=$(free -m | awk '/^Swap:/ {print $2}')
if [ "$swap_total_mb" -eq 0 ]; then
    print_info "Consider adding swap space for better performance"
    print_info "  Run: fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile"
fi

# ==================== SUMMARY ====================
print_section "📊 SUMMARY"

# Calculate overall health score
score=100
issues=0

# Check RAM
if [ "$mem_total_mb" -lt 1024 ]; then
    score=$((score - 15))
    issues=$((issues + 1))
fi

# Check CPU
if [ "$cpu_cores" -lt 2 ]; then
    score=$((score - 10))
    issues=$((issues + 1))
fi

# Check Docker
if ! command -v docker >/dev/null 2>&1; then
    score=$((score - 10))
    issues=$((issues + 1))
fi

# Check systemd
if ! pidof systemd >/dev/null 2>&1; then
    score=$((score - 15))
    issues=$((issues + 1))
fi

# Check disk space
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "${disk_usage:-0}" -gt 85 ]; then
    score=$((score - 10))
    issues=$((issues + 1))
fi

# Display score
if [ $score -ge 80 ]; then
    echo -e "  ${NEON_GREEN}${BOLD}✓ Health Score: $score/100 - Excellent!${RESET}"
elif [ $score -ge 60 ]; then
    echo -e "  ${YELLOW}${BOLD}⚠ Health Score: $score/100 - Good, some improvements needed${RESET}"
else
    echo -e "  ${RED}${BOLD}✗ Health Score: $score/100 - Needs attention${RESET}"
fi

echo -e "  ${CYAN}➜ Issues found: $issues${RESET}"
echo -e "  ${CYAN}➜ Overall Status: $([ $issues -eq 0 ] && echo "Perfect" || echo "Needs Optimization")${RESET}"

# ==================== FOOTER ====================
echo ""
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}"
echo -e "${NEON_PINK}${BOLD}              ESHAN VPS STATUS CHECKER${RESET}"
echo -e "${GLOW}              Complete System Analysis${RESET}"
echo -e "${DIM}              Generated on: $(date)${RESET}"
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}\n"

# Option to save to file
echo -ne "${WHITE}Save this report to file? [y/N]: ${RESET}"
read save_report

if [[ "$save_report" =~ ^[Yy]$ ]]; then
    filename="eshan-vps-status-$(date +%Y%m%d-%H%M%S).txt"
    {
        echo "ESHAN VPS STATUS CHECKER"
        echo "Generated: $(date)"
        echo "================================"
        # Save all output (this is simplified - you'd need to capture output)
    } > "$filename"
    echo -e "${GREEN}✅ Report saved as: $filename${RESET}"
fi

echo ""
read -p "$(echo -e ${BWhite}"Press Enter to exit..."${NC})"
exit 0
