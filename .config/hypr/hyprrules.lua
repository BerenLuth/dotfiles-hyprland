local terminal = "kitty"

---------------------
-- WORKSPACE RULES --
---------------------

hl.workspace_rule({ workspace = "special:magic", on_created_empty = terminal .. " --class=\"magic-terminal\" tmux new-session -A -s magic" })
hl.workspace_rule({ workspace = "special:music", on_created_empty = "feishin"})
hl.workspace_rule({ workspace = "6", on_created_empty = "Telegram | telegram-desktop" })
hl.workspace_rule({ workspace = "4", on_created_empty = terminal .. " --class=\"git-terminal\""})


-- SMART GAPS
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-----------------------
-- APPLICATION RULES --
-----------------------

hl.window_rule({
  name = "coding tools",
  match = {
    class = "^(codium|code|code-oss|zed)$"
  },
  workspace = "2",
})

hl.window_rule({
  name = "git tools",
  match = {
    class = "^(GitKraken|gitui|lazygit)$"
  },
  workspace = "4",
})

hl.window_rule({
  name = "Mail client",
  match = {
    class = "^(org.mozilla.Thunderbird|betterbird)$"
  },
  workspace = "5",
})

hl.window_rule({
  name = "Music player",
  match = {
    class = "^(feishin|Spotify)$"
  },
  workspace = "special:music",
})

hl.window_rule({
  name = "KDE Connect",
  match = {
    class = "^(org.kde.kdeconnect.app)$"
  },
  workspace = "special:kdeconnect",
})

hl.window_rule({
  name = "Blanket",
  match = {
    class = "^(com.rafaelmardojai.Blanket)$"
  },
  workspace = "special:music",
})

hl.window_rule({
  name = "WhatsApp Web",
  match = {
    title = "^(WhatsApp Web)$"
  },
  workspace = "6",
  tile = true,
})

hl.window_rule({
  name = "Telegram",
  match = {
    title = "^(Telegram)$"
  },
  workspace = "6",
  pseudo = false,
  size = { 800, 600 },
})

hl.window_rule({
  name = "Telegram Media Viewer",
  match = {
    title = "^(Media viewer)$"
  },
  workspace = "6",
  float = true,
  fullscreen = false,
  center = true,
  size = { "monitor_w*0.95", "monitor_h*0.95" },
})

hl.window_rule({
  name = "Discord",
  match = {
    class = "^(discord|Discord|vesktop)$"
  },
  workspace = "6",
  pseudo = false,
  size = { "monitor_w*0.9", "monitor_h*0.85" },
})

hl.window_rule({
    name = "Browsers",
    match = {
        class = "^(zen|firefox)$"
    },
    workspace = "1",
})


hl.window_rule({
    name = "kitty waybar tool",
    match = {
        class = "kitty-waybar-tool"
    },
    float = true,
    size = { 800, 500 },
    move = { "monitor_w-window_w-16", 54 },
    xray = true,
    pin = true,
})

hl.window_rule({
  name ="KeePassXC main window",
  match = {
    class = "org.keepassxc.KeePassXC"
  },
  pin = true,
  float = true,
  size = { 1200, 800 },
  center = true,
  rounding = 16,
})

hl.window_rule({
  name ="KeePassXC floating input",
  match = {
    title = "KeePassXC - Browser Access Request",
  },
  float = true,
  size = { 600, 400 },
  move = { "monitor_w-window_w-16", 54 },
})

hl.window_rule({
  name ="Megasync",
  match = {
    title = "MEGAsync",
  },
  float = true,
  move = { "cursor_x-window_w*0.5", 48 },
})

hl.window_rule({
  name = "obsidian",
  match = {
    class = "^(obsidian|md.obsidian.Obsidian)$"
  },
  workspace = "3",
  pseudo = true,
  size = { "monitor_w*0.8", "monitor_h*0.9" },
})

hl.window_rule({
  name = "localsend",
  match = {
    class = "org.localsend.localsend_app"
  },
  float = true,
  size = { 450, 650 },
  move = { "monitor_w-window_w-64", 54 },
  pin = true,
  opacity = 0.8,
  xray = true,
  rounding = 16,
})

hl.window_rule({
  name = "Calculator",
  match = {
    title = "^(gnome-calculator|Calculator|galculator)$"
  },
  float = true,
  size = { 400, 600 },
  move = { "cursor_x-window_w/2", "cursor_y-window_h/2" },
  rounding = 16,
})

hl.window_rule({
  name = "Screenshot tool",
  match = {
    title = "^(Gradia)$"
  },
  float = true,
  size = { "monitor_w*0.9", "monitor_h*0.9" },
  center = true,
  rounding = 16,
  border_size = 4,
})

hl.window_rule({
  name = "Nautilus previewer",
  match = {
    class = "^(org.gnome.NautilusPreviewer)$",
  },
  size = { "monitor_w*0.67", "monitor_h*0.67" },
  center = true,
  float = true,
  rounding = 16,
})

hl.window_rule({
  name = "Calibre viewer",
  match = {
    class = "^(calibre-ebook-viewer)$",
  },
  pseudo = true,
})

hl.window_rule({
  name = "Magic terminal",
  match = {
    class = "magic-terminal"
  },
  fullscreen = true,
})

hl.window_rule({
  name = "Git terminal",
  match = {
    class = "git-terminal"
  },
  pseudo = true,
  size = { "monitor_w*0.8", "monitor_h*0.8" },
})

hl.window_rule({
  name = "ShowMeTheKey",
  match = {
    class = "^(showmethekey-gtk)$"
  },
  float = true,
  size = { 525, 100 },
  move = { "monitor_w - window_w - 32", "monitor_h*0.9" },
  opacity = 0.8,
  rounding = 20,
  pin = true
})

hl.window_rule({
  name = "Zbar",
  match = {
    class = "^(zbar)$"
  },
  float = true,
  size = { 600, 340 },
  move = { "monitor_w - window_w - 32", "monitor_h*0.06" },
  opacity = 0.8,
  rounding = 20,
  pin = true,
})

hl.window_rule({
  name = "Pulseaudio",
  match = {
    class = "^(org.pulseaudio.pavucontrol)$"
  },
  float = true,
  size = { 800, 500 },
  move = { "monitor_w-832", 54 },
  rounding = 16,
})


-----------------
-- LAYER RULES --
-----------------



hl.layer_rule({
    name = "wlogout",
    match = {
        namespace = "logout_dialog"
    },
    blur = true,
    xray = true,
})

hl.layer_rule({
    name = "swaync",
    match = {
        namespace = "swaync-control-center"
    },
    blur = true,
    xray = true,
    ignore_alpha = 0,
    dim_around = true,
    blur_popups = true,
})

hl.layer_rule({
    name = "swaync-notification",
    match = {
        namespace = "swaync-notification-window"
    },
    blur = true,
    xray = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "rofi",
    match = {
        namespace = "rofi"
    },
    blur = true,
    ignore_alpha = 0,
    dim_around = true,
})

hl.layer_rule({
    name = "waybar",
    match = {
        namespace = "waybar"
    },
    blur = true,
    ignore_alpha = 0,
})