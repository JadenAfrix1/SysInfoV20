#!/bin/bash
# SysInfoV20 Installer
# Author: JadenAfrix1

echo "[*] Installing required packages..."
pkg update -y && pkg upgrade -y
pkg install git termux-api curl coreutils util-linux grep awk jq -y

echo "[*] Cloning SysInfoV20..."
git clone https://github.com/JadenAfrix1/SysInfoV20.git
cd SysInfoV20 || exit

chmod +x sysinfov20.sh
echo "[*] Installation complete."
echo "Run the tool with: ./sysinfov20.sh"
