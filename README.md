# SysInfoV20
**Advanced Professional Termux System Information Tool**  

SysInfoV20 retrieves every possible detail about your Android device in a clean, professional, and visually striking terminal interface.

## Features
- Device details (manufacturer, model, build, Android version, fingerprint, kernel, security patch)
- Battery (status, health, capacity, temperature)
- Memory usage
- Storage usage
- CPU details
- Network info (local IPs, carrier, network type, public IP, WiFi MAC)
- System status (uptime, SELinux, boot time)
- Installed package count
- Sensors list (if accessible)

## Installation
```bash
pkg install git -y
git clone https://github.com/JadenAfrix1/SysInfoV20.git
cd SysInfoV20
chmod +x install.sh
./install.sh

Usage

./sysinfov20.sh
