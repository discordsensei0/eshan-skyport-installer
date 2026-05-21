#!/usr/bin/env bash

# ===================================================
#        ESHAN IDX SETUP - PREMIUM EDITION
#                   2026 Edition
# ===================================================
#  Created by: Eshan
#  IDX Development Environment Setup
# ===================================================

set -e

# Next-Gen Neon Color Theme
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
UNDERLINE="\e[4m"

CYAN="\e[96m"
BLUE="\e[94m"
PURPLE="\e[95m"
GREEN="\e[92m"
YELLOW="\e[93m"
RED="\e[91m"
WHITE="\e[97m"

NEON_GREEN="\e[38;5;82m"
NEON_PURPLE="\e[38;5;165m"
NEON_BLUE="\e[38;5;75m"
NEON_PINK="\e[38;5;206m"
NEON_ORANGE="\e[38;5;214m"
GLOW="\e[38;5;51m"
DANGER="\e[38;5;196m"
GOLD="\e[38;5;220m"

clear

# Eshan Header
echo -e "${GOLD}"
cat << "EOF"
    ███████╗███████╗██╗  ██╗ █████╗ ███╗   ██╗
    ██╔════╝██╔════╝██║  ██║██╔══██╗████╗  ██║
    ███████╗███████╗███████║███████║██╔██╗ ██║
    ╚════██║╚════██║██╔══██║██╔══██║██║╚██╗██║
    ███████║███████║██║  ██║██║  ██║██║ ╚████║
    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
EOF
echo -e "${NEON_PURPLE}${BOLD}               IDX SETUP - PREMIUM EDITION${RESET}"
echo -e "${GLOW}           Next-Gen Development Environment Setup${RESET}"
echo -e "${DIM}         Created by: ${BOLD}Eshan${RESET}"
echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}\n"

# Utility Functions
progress() { echo -e "${NEON_GREEN}${BOLD}⚡ $1${RESET}"; }
success() { echo -e "${GREEN}${BOLD}✓ $1${RESET}"; }
warning() { echo -e "${NEON_ORANGE}${BOLD}! $1${RESET}"; }
error() { echo -e "${RED}${BOLD}✘ $1${RESET}"; }

print_box_header() {
    local text="$1"
    local color="${2:-$NEON_PURPLE}"
    echo -e "${color}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${color}${BOLD}║${RESET} ${WHITE}${BOLD}$text$(printf '%*s' $((58 - ${#text})) '') ${color}${BOLD}║${RESET}"
    echo -e "${color}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}\n"
}

print_menu_option() {
    local num="$1"
    local text="$2"
    echo -e "${NEON_BLUE}   ┌──────────────────────────────────────────────────────┐${RESET}"
    echo -e "${NEON_BLUE}   │${RESET} ${WHITE}${BOLD}[${NEON_GREEN}${num}${WHITE}]${RESET} ${GOLD}${text}$(printf '%*s' $((48 - ${#text} - 3)) '') ${NEON_BLUE}│${RESET}"
    echo -e "${NEON_BLUE}   └──────────────────────────────────────────────────────┘${RESET}"
}

# Main Menu
main_menu() {
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
    echo -e "${NEON_PURPLE}${BOLD}         DEVELOPMENT MANAGEMENT CONSOLE${RESET}\n"

    print_box_header "ESHAN MAIN OPTIONS" $GOLD

    print_menu_option "1" "IDX Tool Setup (Nix + QEMU Environment)"
    print_menu_option "2" "IDX VPS Maker (Remote Deployment)"
    print_menu_option "3" "Exit Console"

    echo -e "\n${GOLD}══════════════════════════════════════════════════════════${RESET}"
    read -p $'\e[38;5;214m\e[1m   Select Option [1-3]: \e[0m' op
    echo
}

# Main Loop
while true; do
    main_menu

    case $op in
        1)
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
            print_box_header "IDX TOOL SETUP" $GOLD

            progress "Initializing workspace cleanup..."
            cd ~ || exit 1
            rm -rf myapp flutter 2>/dev/null

            mkdir -p vps123
            cd vps123

            if [ ! -d ".idx" ]; then
                progress "Creating IDX development environment..."

                mkdir -p .idx
                cd .idx

                progress "Generating dev.nix configuration..."
                cat > dev.nix << 'EOF'
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    unzip
    openssh
    git
    qemu_kvm
    sudo
    cdrkit
    cloud-utils
    qemu
    flutter
    dart
  ];

  env = {
    EDITOR = "nano";
  };

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];
    workspace = {
      onCreate = {};
      onStart = {};
    };
    previews = {
      enable = true;
    };
  };
}
EOF

                success "IDX Tool Setup Complete!"
                echo -e "\n${GLOW}${BOLD}Location:${RESET} ${WHITE}~/vps123/.idx${RESET}"
                echo -e "${GLOW}${BOLD}Channel:${RESET}  ${WHITE}Nix Stable 24.05${RESET}"
                echo -e "${GLOW}${BOLD}Tools:${RESET}    ${WHITE}Flutter, Dart, QEMU, Git, SSH${RESET}\n"
            else
                warning "IDX environment already exists!"
                echo -e "   Path: ${WHITE}~/vps123/.idx${RESET}\n"
            fi

            echo -e "${GOLD}══════════════════════════════════════════════════════════${RESET}"
            read -p $'\e[38;5;214mPress Enter to return...\e[0m' -r
            ;;

        2)
            clear
            echo -e "${NEON_PURPLE}"
            cat << "EOF"
    ███████╗███████╗██╗  ██╗ █████╗ ███╗   ██╗
    ██╔════╝██╔════╝██║  ██║██╔══██╗████╗  ██║
    ███████╗███████╗███████║███████║██╔██╗ ██║
    ╚════██║╚════██║██╔══██║██╔══██║██║╚██╗██║
    ███████║███████║██║  ██║██║  ██║██║ ╚████║
    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
EOF
            print_box_header "IDX VPS MAKER" "$NEON_PURPLE"

            progress "Launching Eshan Cloud VM Manager..."
            echo -e "\n${CYAN}Streaming the latest version from GitHub...${RESET}\n"

            if command -v curl >/dev/null 2>&1; then
                if bash <(curl -s https://raw.githubusercontent.com/discordsensei0/eshan-skyport-installer/main/main.sh); then
                    success "Cloud VM Manager session completed successfully."
                else
                    error "Failed to fetch or execute the script."
                    warning "Check your internet connection or GitHub status."
                fi
            else
                error "curl is not installed."
                warning "Install it with: sudo apt install curl (or equivalent)"
            fi
            echo -e "\n${GOLD}════════════════════════════════════════════════════════════════════${RESET}"
            read -p $'\e[38;5;214mPress Enter to return to main menu...\e[0m' -r
            ;;

        3)
            clear
            echo -e "${DANGER}"
            cat << "EOF"
    ███████╗███████╗██╗  ██╗ █████╗ ███╗   ██╗
    ██╔════╝██╔════╝██║  ██║██╔══██╗████╗  ██║
    ███████╗███████╗███████║███████║██╔██╗ ██║
    ╚════██║╚════██║██╔══██║██╔══██║██║╚██╗██║
    ███████║███████║██║  ██║██║  ██║██║ ╚████║
    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
EOF
            print_box_header "SESSION TERMINATED" $DANGER

            echo -e "\n${WHITE}${BOLD}   Thank you for using Eshan IDX Setup!${RESET}"
            echo -e "${GOLD}${BOLD}           Made with ❤️ by Eshan${RESET}\n"

            echo -e "${NEON_GREEN}${BOLD}Created by: Eshan${RESET}"
            echo -e "${GLOW}${BOLD}IDX Development Environment${RESET}\n"

            echo -e "${NEON_PINK}${BOLD}See you in the next session, Operator! 🚀${RESET}\n"
            exit 0
            ;;

        *)
            clear
            print_box_header "INVALID SELECTION" $DANGER
            error "Please enter a valid option (1–3)"
            sleep 2
            ;;
    esac
done
