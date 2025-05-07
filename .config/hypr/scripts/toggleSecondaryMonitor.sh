#!/bin/bash
# ~/.config/hypr/toggle_hdmi.sh

STATUS=$(hyprctl monitors | grep "HDMI-A-1")

if [ -n "$STATUS" ]; then
  hyprctl keyword monitor HDMI-A-1,disable
else
  # 90-degree rotation on enable
  hyprctl keyword monitor HDMI-A-1,1920x1080@60,0x0,1,transform,3
fi
