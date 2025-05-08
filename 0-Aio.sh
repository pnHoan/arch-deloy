#!bin/bash

# Network manager issue
nmcli connection modify Wired\ connection\ 1 ipv6.method "disabled"

echo
tput setaf 2
echo "########################################################################"
echo "################### Installing software ################################"
echo "########################################################################"
tput sgr0
echo

# Define your package list
packages=(
libwnck3
mesa-utils
xf86-input-libinput
xorg-xdpyinfo
xorg-server
xorg-xinit
xorg-xinput
xorg-xkill
xorg-xrandr
b43-fwcutter
broadcom-wl-dkms
dnsmasq
dnsutils
ethtool
iwd
modemmanager
networkmanager
networkmanager-openconnect
networkmanager-openvpn
nss-mdns
openssh
usb_modeswitch
wpa_supplicant
xl2tpd
downgrade
pacman-contrib
pkgfile
rebuild-detector
reflector
yay
accountsservice
bash-completion
bluez
bluez-utils
ffmpegthumbnailer
gst-libav
gst-plugin-pipewire
gst-plugins-bad
gst-plugins-ugly
libdvdcss
libgsf
libopenraw
plocate
poppler-glib
xdg-user-dirs
xdg-utils
efitools
haveged
nfs-utils
nilfs-utils
ntp
smartmontools
unrar
unzip
xz
cantarell-fonts
freetype2
noto-fonts
noto-fonts-emoji
noto-fonts-cjk
noto-fonts-extra
ttf-bitstream-vera
ttf-dejavu
ttf-liberation
ttf-opensans
alsa-firmware
alsa-plugins
alsa-utils
pavucontrol
pipewire-pulse
wireplumber
pipewire-alsa
pipewire-jack
rtkit
dmidecode
hdparm
hwdetect
lsscsi
mtools
sg3_utils
sof-firmware
power-profiles-daemon
upower
intel-ucode
alacritty
arandr
awesome-terminal-fonts
catfish
dmenu
evince
galculator
network-manager-applet
numlockx
pamac-aur
xcolor
adobe-source-sans-fonts
aic94xx-firmware
archlinux-tools
avahi
baobab
bat
bibata-cursor-theme
breeze-icons
btop
chromium
curl
dconf-editor
devtools
duf
feh
fastfetch-git
firefox
fish
font-manager
git
gnome-disk-utility
gparted
gvfs
gvfs-afc
gvfs-dnssd
gvfs-gphoto2
gvfs-mtp
gvfs-nfs
gvfs-smb
hardcode-fixer-git
hardinfo2
hddtemp
hw-probe
linux-firmware-qlogic
lshw
man-db
man-pages
mkinitcpio-firmware
meld
most
nomacs
polkit-gnome
python-pylint
python-pywal
ripgrep
rsync
thunar
thunar-archive-plugin
thunar-volman
tree
ttf-droid
ttf-hack
ttf-inconsolata
ttf-roboto
ttf-roboto-mono
ttf-ubuntu-font-family
upd72020x-fw
vlc
wd719x-firmware
wget
zsh
gzip
p7zip
unace
qt5ct
kvantum-qt5
findutils
glances
hwinfo
inxi
nano-syntax-highlighting
pv
python-defusedxml
python-packaging
tldr
sed
vi
firewalld
python-pyqt6
aspell
blueman
file-roller
lightdm
lightdm-slick-greeter
mousepad
parole
ristretto
thunar-media-tags-plugin
xdg-user-dirs-gtk
xfce4
xfce4-battery-plugin
xfce4-datetime-plugin
xfce4-mount-plugin
xfce4-netload-plugin
xfce4-notifyd
xfce4-pulseaudio-plugin
xfce4-screensaver
xfce4-screenshooter
xfce4-taskmanager
xfce4-wavelan-plugin
xfce4-weather-plugin
xfce4-whiskermenu-plugin
xfce4-xkb-plugin
)

# Install packages
for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo "✔ $pkg is already installed."
    else
        echo "➤ Installing $pkg..."
        sudo pacman -S --noconfirm --needed "$pkg"
    fi
done

echo
tput setaf 2
echo "########################################################################"
echo "################### Apply config ################################"
echo "########################################################################"
tput sgr0
echo

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service

# Enable and start Bluetooth service
sudo systemctl enable bluetooth.service || { echo "Failed to enable bluetooth.service"; exit 1; }
sudo systemctl start bluetooth.service || { echo "Failed to start bluetooth.service"; exit 1; }

# Enable PipeWire services
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo