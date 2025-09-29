#!/bin/bash 

rm ~/.config/waybar/style.css

if [ -f ~/.config/waybar/theme-dark ]; then
  mv ~/.config/waybar/theme-dark ~/.config/waybar/theme-light
  ln -s ~/.config/waybar/dark.css ~/.config/waybar/style.css
else
  mv ~/.config/waybar/theme-light ~/.config/waybar/theme-dark
  ln -s ~/.config/waybar/light.css ~/.config/waybar/style.css
fi

~/.config/hypr/scripts/restart-waybar.sh
~/.config/hypr/scripts/restart-hyprpaper.sh
