---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "~/.config/rofi/launchers/type-1/launcher.sh"


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("swaync")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("openrgb --server && sleep 2 && openrgb -m static -c FF4400")
  hl.exec_cmd('syshud -m "0 0 64 0"')
  hl.exec_cmd("wal -i ~/.config/hypr/wallpaper/wallpaper && openrgb -c $(wal-accent)")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh &")

  hl.exec_cmd("sleep 2 && keepassxc &")
  hl.exec_cmd("sleep 3 && nm-online --quiet --timeout 120 && megasync --minimized")

  -- Disable bluetooth on startup
  hl.exec_cmd("bluetoothctl list | grep -q \"Controller\" && bluetoothctl power off")

  -- clipboard manager
  hl.exec_cmd("wl-paste --type text --watch cliphist store # Stores only text data")
  hl.exec_cmd("wl-paste --type image --watch cliphist store # Stores only image data")

  -- Hooks for power profiles management
  hl.exec_cmd("~/.local/bin/power-profile-dbus-daemon.sh")
  
  -- exec-once = bongocat -c ~/.config/bongocat/bongocat.conf &

  -- Cursor
  hl.exec_cmd("hyprctl setcursor Adwaita 24")
end)