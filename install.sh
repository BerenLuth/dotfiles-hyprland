#!/bin/bash

cd "$(dirname "$0")"

read -p "Do you want to install the packages? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  yay -S hyprland hyprpaper hyprlock hypridle waybar swaync kitty xdg-desktop-portal-hyprland wlogout hyprshot battop syshud hyprsunset rofi-wayland python-pywal cliphist gowall
  yay -S --asdeps ddcutil
  hyprpm add https://github.com/hyprwm/hyprland-plugins
  hyprpm enable hyprexpo
  hyprpm reload
else
  echo "Packages installation skipped."
fi

# Define the list of folders
folders=("fastfetch" "hypr" "kitty" "rofi" "swaync" "sys64" "waybar" "wlogout")

for folder in "${folders[@]}"; do
  cp -r ./.config/$folder ~/.config
done

cp -r ./.bin/* ~/.bin

# Define the list of files
files=(".zshrc")

for file in "${files[@]}"; do
  cp ./.config/$file ~/
done
