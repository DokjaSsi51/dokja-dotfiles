#! /usr/bin/env zsh

waybar &
nm-applet &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
hyprpaper &
/usr/lib/hyprpolkitagent/hyprpolkitagent &
/usr/lib/xdg-desktop-portal &
/home/dokja/dokja-dotfiles/scripts/dokja-update &