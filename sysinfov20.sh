#!/data/data/com.termux/files/usr/bin/bash
# SysInfoV20 - Advanced Professional Termux System Information Tool
# Author: JadenAfrix1
# GitHub: https://github.com/JadenAfrix1/SysInfoV20

# === Colors ===
BOLD="\e[1m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# === Functions ===
sep() { echo -e "${CYAN}--------------------------------------------------${RESET}"; }
loading() { echo -ne "${YELLOW}$1"; sleep 0.05; echo -ne "."; sleep 0.05; echo -ne "."; sleep 0.05; echo -e ".${RESET}"; }

# === Banner ===
clear
if [ -f "assets/banner.txt" ]; then
    echo -e "${GREEN}${BOLD}"
    cat assets/banner.txt
    echo -e "${RESET}"
else
    echo -e "${GREEN}${BOLD}SysInfoV20${RESET}"
fi
echo

# === Start Scan ===
loading "Initializing SysInfoV20"
sleep 0.2
loading "Collecting device data"
sleep 0.2
loading "Analyzing system properties"
sleep 0.2
loading "Finalizing"
sleep 0.3

# === Device Info ===
sep
echo -e "${YELLOW}${BOLD}📌 DEVICE INFORMATION${RESET}"
echo "Manufacturer     : $(getprop ro.product.manufacturer)"
echo "Brand            : $(getprop ro.product.brand)"
echo "Model            : $(getprop ro.product.model)"
echo "Android Version  : $(getprop ro.build.version.release)"
echo "SDK Level        : $(getprop ro.build.version.sdk)"
echo "Build ID         : $(getprop ro.build.id)"
echo "CPU ABI          : $(getprop ro.product.cpu.abi)"
echo "Hardware         : $(getprop ro.hardware)"
echo "Platform         : $(getprop ro.board.platform)"
echo "Fingerprint      : $(getprop ro.build.fingerprint)"
echo "Kernel Version   : $(uname -r)"
echo "Security Patch   : $(getprop ro.build.version.security_patch)"

# === Battery Info ===
sep
echo -e "${YELLOW}${BOLD}🔋 BATTERY INFORMATION${RESET}"
termux-battery-status | jq -r 'to_entries[] | "\(.key): \(.value)"'

# === Memory ===
sep
echo -e "${YELLOW}${BOLD}🧠 MEMORY${RESET}"
free -h

# === Storage ===
sep
echo -e "${YELLOW}${BOLD}💾 STORAGE${RESET}"
df -h | grep -E "Filesystem|/storage/emulated"

# === CPU Info ===
sep
echo -e "${YELLOW}${BOLD}⚙️ CPU INFORMATION${RESET}"
cat /proc/cpuinfo | grep -E "Processor|Hardware|CPU architecture|model name"

# === Network Info ===
sep
echo -e "${YELLOW}${BOLD}🌐 NETWORK INFORMATION${RESET}"
echo "Local IPs:"
ip addr show | grep "inet " | awk '{print $2}'
echo "Carrier         : $(getprop gsm.operator.alpha)"
echo "Network Type    : $(getprop gsm.network.type)"
echo -n "Public IP       : "
curl -s ifconfig.me || echo "Unavailable"
echo "WiFi MAC        : $(ip link show wlan0 | grep ether | awk '{print $2}')"

# === System Status ===
sep
echo -e "${YELLOW}${BOLD}📊 SYSTEM STATUS${RESET}"
echo "Uptime          : $(uptime -p)"
echo "SELinux Status  : $(getenforce)"
echo "Boot Time       : $(who -b | awk '{print $3, $4}')"

# === Installed Packages ===
sep
echo -e "${YELLOW}${BOLD}📦 INSTALLED PACKAGES${RESET}"
pkg list-installed | wc -l | awk '{print "Packages Installed: " $1}'

# === Sensors ===
sep
echo -e "${YELLOW}${BOLD}📡 SENSORS${RESET}"
dumpsys sensorservice 2>/dev/null | grep -E "Sensor|name" | head -n 10 || echo "Sensor info not accessible."

sep
echo -e "${GREEN}${BOLD}✔ Scan complete. SysInfoV20 finished successfully.${RESET}"
