---------------------
---- MY PROGRAMS ----
---------------------



-- Set programs that you use
local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "~/.config/rofi/launchers/type-1/launcher.sh"
local mainMonitor = "eDP-1"

require("monitors")


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

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,

    border_size = 2,

    col = {
      active_border = {
        colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
        angle = 45,
      },
      inactive_border = "rgba(000000aa)"
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle"
  },

  decoration = {
    rounding = 8,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 1,
      color = "rgba(1a1a1aee)",
      sharp = false,
    },

    blur = {
      enabled = true,
      size = 5,
      passes = 2,

      vibrancy = 0.1696,
      xray = false,
    }
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
    default_split_ratio = 1.3,
  },

  master = {
    new_status = "master",
  },

  scrolling = {
    column_width = 0.9,
    follow_focus = true,
    follow_min_visible = 1,
    focus_fit_method = 0,
    direction = "right",
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = true,
    animate_manual_resizes = true,
    focus_on_activate = true,
  },

  input = {
    kb_layout = "it",
    kb_options = "caps:escape_shifted_capslock",
    
    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = true,
    },

    numlock_by_default = true,
    accel_profile = "adaptive",
  },

  gestures = {
    workspace_swipe_distance = 700,
    workspace_swipe_cancel_ratio = 0.2,
    workspace_swipe_min_speed_to_force = 5,
    workspace_swipe_direction_lock = true,
    workspace_swipe_direction_lock_threshold = 10,
    workspace_swipe_create_new = true
  }
})


hl.curve("myBezier", {
    type = "bezier",
    points = {{0.16, 1}, {0.3, 1}}
})


hl.curve("myBezierOvershoot", {
    type = "bezier",
    points = {{0.16, 1}, {0.3, 1.05}}
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "myBezier",
    style = "slide"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "myBezier",
    style = "slide 80%"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5,
    bezier = "default"
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 3,
    bezier = "default"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "default"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "myBezierOvershoot",
    style = "slidevert"
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 3,
    bezier = "myBezier",
    style = "slidevert"
})

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 3, direction = "swipe", mods = "SUPER", action = "resize" })
hl.gesture({ fingers = 3, direction = "right", action = function()
        hl.dispatch(hl.dsp.global("movefocus:l"))
    end })
hl.gesture({ fingers = 3, direction = "left", action = function()
        hl.dispatch(hl.dsp.global("movefocus:r"))
    end })

hl.gesture({ fingers = 4, direction = "vertical", action = "special", workspace_name="magic" })

hl.gesture({ fingers = 4, direction = "vertical", mods = "CTRL", action = "special", workspace_name="music" })

hl.gesture({ fingers = 4, direction = "up", mods = "SUPER", action = "cursorZoom", zoom_level = 2.5, mode = "mult" })

hl.gesture({ fingers = 4, direction = "down", mods = "SUPER", action = "cursorZoom", zoom_level = -1, mode = "mult" })

hl.gesture({ fingers = 4, direction = "left", action = function()
        hl.dispatch(hl.dsp.global("workspace:6"))
    end })

    hl.gesture({ fingers = 4, direction = "right", action = function()
        hl.dispatch(hl.dsp.global("workspace:previous"))
    end })


-- Workspaces from 1 to 5 are assigned to monitor $mainMonitor
for i = 1, 5 do
  hl.workspace_rule({ workspace = tostring(i), monitor = mainMonitor})
end

for i = 6, 10 do
  hl.workspace_rule({ workspace = tostring(i), monitor = "$secondaryMonitor"})
end

require("hyprbinds")
require("hyprrules")
require("privacy")