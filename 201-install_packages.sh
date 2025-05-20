#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Install base packages #############################"
echo "########################################################################"
tput sgr0
echo

# Xorg and Input: Graphics and input drivers for GUI
sudo pacman -S --noconfirm --needed xorg-server           # Core X server for graphical interface
sudo pacman -S --noconfirm --needed xorg-xinit           # Initializes X sessions (e.g., via .xinitrc)
sudo pacman -S --noconfirm --needed xorg-xrandr          # Manages screen resolution and rotation
sudo pacman -S --noconfirm --needed xf86-input-libinput  # Input driver for touchpad and keyboard
sudo pacman -S --noconfirm --needed xorg-xset            # Adjusts X server settings (e.g., screen blanking) # NEW
 
# Networking: Tools for Wi-Fi, Ethernet, and network services
sudo pacman -S --noconfirm --needed networkmanager       # Manages Wi-Fi and Ethernet connections
sudo pacman -S --noconfirm --needed nss-mdns             # Enables local hostname resolution (.local)
sudo pacman -S --noconfirm --needed wpa_supplicant       # Handles Wi-Fi authentication
sudo pacman -S --noconfirm --needed dnsutils             # Provides DNS tools (dig, nslookup)
sudo pacman -S --noconfirm --needed ethtool              # Configures Ethernet interfaces
sudo pacman -S --noconfirm --needed iwd                  # Modern Wi-Fi backend (optional with NetworkManager)
sudo pacman -S --noconfirm --needed network-manager-applet # System tray applet for NetworkManager # NEW
sudo pacman -S --noconfirm --needed avahi                # mDNS/DNS-SD for network discovery # NEW

# Arch Tools: Package management and system maintenance
sudo pacman -S --noconfirm --needed pacman-contrib       # Scripts for package management (e.g., paccache)
sudo pacman -S --noconfirm --needed pkgfile              # Finds which package owns a file
sudo pacman -S --noconfirm --needed yay                  # AUR helper for community packages
sudo pacman -S --noconfirm --needed archlinux-keyring    # Keyring for package signing # NEW
 
# System Utilities: General system functionality and user tools
sudo pacman -S --noconfirm --needed bash-completion      # Enhances terminal command completion
sudo pacman -S --noconfirm --needed bluez                # Bluetooth protocol stack
sudo pacman -S --noconfirm --needed bluez-utils          # Tools for Bluetooth configuration
sudo pacman -S --noconfirm --needed xdg-user-dirs        # Creates standard user directories (e.g., Documents)
sudo pacman -S --noconfirm --needed xdg-utils            # Desktop integration (e.g., opening URLs)
sudo pacman -S --noconfirm --needed smartmontools        # Monitors SSD health
sudo pacman -S --noconfirm --needed unrar                # Extracts RAR archives
sudo pacman -S --noconfirm --needed unzip                # Extracts ZIP archives
sudo pacman -S --noconfirm --needed xz                   # Handles XZ compression (used by Arch packages)
sudo pacman -S --noconfirm --needed htop                 # Interactive process viewer # NEW
sudo pacman -S --noconfirm --needed fastfetch            # Displays system information # NEW
sudo pacman -S --noconfirm --needed gvfs                 # Virtual filesystem for file managers # NEW

# Fonts: Font rendering and display
sudo pacman -S --noconfirm --needed cantarell-fonts      # Clean sans-serif font (used by GNOME)
sudo pacman -S --noconfirm --needed freetype2            # Font rendering engine
sudo pacman -S --noconfirm --needed noto-fonts           # Comprehensive font set for most languages
sudo pacman -S --noconfirm --needed noto-fonts-emoji     # Emoji font support
sudo pacman -S --noconfirm --needed ttf-dejavu           # Versatile font for broad compatibility
sudo pacman -S --noconfirm --needed ttf-roboto           # Modern sans-serif font # NEW

# Audio: Sound system and control
sudo pacman -S --noconfirm --needed alsa-utils           # ALSA configuration tools (e.g., alsamixer)
sudo pacman -S --noconfirm --needed pavucontrol          # GUI for audio control (works with Pipewire)
sudo pacman -S --noconfirm --needed pipewire-pulse       # PulseAudio compatibility for Pipewire
sudo pacman -S --noconfirm --needed wireplumber          # Pipewire session manager
sudo pacman -S --noconfirm --needed pipewire-alsa        # ALSA compatibility for Pipewire
sudo pacman -S --noconfirm --needed rtkit                # Realtime kit for audio processing

# Multimedia: Media playback and processing
sudo pacman -S --noconfirm --needed vlc                  # Versatile media player # NEW
sudo pacman -S --noconfirm --needed ffmpeg               # Multimedia framework for encoding/decoding # NEW
sudo pacman -S --noconfirm --needed gstreamer            # Multimedia framework # NEW
sudo pacman -S --noconfirm --needed gst-plugins-base     # Core GStreamer plugins # NEW
sudo pacman -S --noconfirm --needed gst-plugins-good     # Additional GStreamer plugins # NEW

# Productivity: Web browsing and office tools
sudo pacman -S --noconfirm --needed firefox              # Web browser # NEW
sudo pacman -S --noconfirm --needed libreoffice-fresh    # Office suite for documents and spreadsheets # NEW
sudo pacman -S --noconfirm --needed file-roller          # GUI archive manager # NEW

# Hardware and Firmware: Hardware detection and firmware updates
sudo pacman -S --noconfirm --needed dmidecode            # Retrieves hardware information
sudo pacman -S --noconfirm --needed hdparm               # Configures disk settings (e.g., SSDs)
sudo pacman -S --noconfirm --needed hwdetect             # Detects hardware during setup
sudo pacman -S --noconfirm --needed lsscsi               # Lists SCSI devices
sudo pacman -S --noconfirm --needed sg3_utils            # Manages SCSI devices
sudo pacman -S --noconfirm --needed sof-firmware         # Firmware for Intel audio DSP
sudo pacman -S --noconfirm --needed intel-ucode          # Microcode updates for Intel CPU