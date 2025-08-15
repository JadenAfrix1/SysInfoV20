# SysInfoV20
**Advanced Professional Termux System Information Tool**

SysInfoV20 gives you comprehensive, real-time Android device info in a clean, professional terminal dashboard.

---

## Features

- Device: Manufacturer, Model, Build, Android version, Fingerprint, Kernel, Security patch
- Battery: Status, Health, Capacity, Temperature
- Memory usage
- Storage usage
- CPU details
- Network: Local IPs, Carrier, Network type, Public IP, WiFi MAC
- System status: Uptime, SELinux, Boot time
- Installed package count
- Sensors list (if accessible)

---

## Installation

Copy and run each command in Termux:

```bash
pkg install git -y
```
```bash
git clone https://github.com/JadenAfrix1/SysInfoV20.git
```
```bash
cd SysInfoV20
```
```bash
chmod +x install.sh
```
```bash
./install.sh
```

---

## Usage

To launch:

```bash
./sysinfov20.sh
```

**If you encounter a failure, try:**
```bash
bash sysinfo.sh
```

---

## Professional Output Example

```
┌────────────── SysInfoV20 ──────────────┐
│ Device:      Samsung Galaxy S23 Ultra  │
│ Android:     14 (Kernel 6.1.23)        │
│ Battery:     92% (Good) 33.2°C         │
│ CPU:         8x ARMv8 @ 3.0GHz         │
│ RAM:         5.6GB / 8GB (70%)         │
│ Storage:     68GB / 128GB (53%)        │
│ Uptime:      2d 8h 15m                 │
│ Network:     WiFi, IP: 192.168.1.5     │
│ Packages:    980                       │
│ Sensors:     Accelerometer, Gyro, ...  │
└────────────────────────────────────────┘
```

---

## Troubleshooting

If the main script fails to run, use the fallback:

```bash
bash sysinfo.sh
```

---

## License

MIT © JadenAfrix1
