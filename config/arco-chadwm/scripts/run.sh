#!/bin/sh

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"

#for real metal
#run xrandr --output DVI-1 --right-of DVI-0 --auto
#run xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output None-1-1 --off
#run xrandr --output DVI-D-1 --right-of DVI-I-1 --auto
#run xrandr --output DVI-I-0 --right-of HDMI-0 --auto
#run xrandr --output eDP-1 --primary --mode 1368x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#run xrandr --output HDMI2 --right-of HDMI1 --auto
#run xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal

#autorandr horizontal
#run "autorandr horizontal"

run "nm-applet"
#run "protonvpn-app"
run "flameshot"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom -b  --config ~/.config/arco-chadwm/picom/picom.conf &
# picom -b  --config ~/.config/arco-chadwm/picom/picom-cachyos.conf &
# picom -b  --config ~/.config/arco-chadwm/picom/picom-edu-dwm.conf &
# picom -b  --config ~/.config/arco-chadwm/picom/picom-edu-nodwm.conf &
# picom -b  --config ~/.config/arco-chadwm/picom/picom-original.conf &
# picom --backend glx --vsync &
run "volumeicon"
feh --bg-fill ~/.config/arco-chadwm/wallpaper/chadwm2.jpg &

pkill bar.sh
~/.config/arco-chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
