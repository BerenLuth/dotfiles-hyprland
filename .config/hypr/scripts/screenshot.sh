#!/usr/bin/env bash

# Screenshot script for Hyprland using hyprshot and satty
# Based on OMARCHY's script
#
# Usage: ./screenshot.sh [mode]
# Modes: output, window, region (default: region)

OUTPUT_DIR="$HOME/Pictures/Screenshots/edited"
mkdir -p "$OUTPUT_DIR"

hyprshot -m ${1:-region} --raw |
  satty --filename - \
    --output-filename "$OUTPUT_DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
    --early-exit \
    --actions-on-enter save-to-clipboard\
    --copy-command 'wl-copy' \
    --save-after-copy