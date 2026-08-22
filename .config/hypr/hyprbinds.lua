local mainMod = "SUPER"
local fileManager = "nautilus"
local menu        = "~/.config/rofi/launchers/type-1/launcher.sh"
local mailClient  = "thunderbird"

local function changeWorkspace(i)
    return "hyprctl dispatch 'hl.dsp.focus({ workspace = " .. i .. " })'"
end

hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/configMonitors.sh && hyprctl reload"), { description = "Reload hyprland config" })
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"), { description = "App: Terminal" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "App: File Manager" })
hl.bind(mainMod .. " + V", hl.dsp.window.float(), { description = "Toggle window float" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("hyprctl dispatch fullscreenstate 0 & " .. menu), { description = "Open the app launcher" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(menu .. " window"), { description = "Open the window switcher" })
hl.bind(mainMod .. " + TAB", hl.dsp.group.next(), { description = "Switch to next window in group" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle window pseudo" })
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layoutmsg("fit"), { description = "Description" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle window fullscreen" })
hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { description = "Cycle to next window" })
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.toggle(), { description = "Toggle group" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("togglesplit"))

-- MOVE FOCUS WITH mainMod + arrow keys
for i = 1, 4 do
    local arrowkey = { "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind("SUPER + " .. arrowkey[i], hl.dsp.focus({ direction = focusdir[i] }),
        { description = "Window: Focus " .. arrowkey[i] })
end

for i = 1, 4 do
    local vimKey = { "H", "L", "K", "J" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind("SUPER + " .. vimKey[i], hl.dsp.focus({ direction = focusdir[i] }),
        { description = "Window: Focus " .. vimKey[i] })
end

for i = 1, 10 do
    hl.bind("SUPER + " .. (i % 10), function()
        hl.dispatch(hl.dsp.focus({ workspace = i }))
    end, { description = "Workspace: Focus " .. i })
end

-- Change workspace
hl.bind("CTRL + ALT + Down", hl.dsp.focus({ workspace = "r+1"}), { description = "Move to the next workspace" })
hl.bind("CTRL + ALT + Up", hl.dsp.focus({ workspace = "r-1"}), { description = "Move to the previous workspace" })

hl.bind("CTRL + ALT + J", hl.dsp.focus({ workspace = "e+1"}), { description = "Move to the next active workspace" })
hl.bind("CTRL + ALT + K", hl.dsp.focus({ workspace = "e-1"}), { description = "Move to the previous active workspace" })

hl.bind(mainMod .. " + backslash", hl.dsp.focus({ workspace = "previous"}), { description = "Move to the previous workspace" })

-- Change workspace (mouse)
hl.bind("CTRL + ALT + mouse:276", hl.dsp.focus({ workspace = "r-1"}), { description = "Move to the next workspace (mouse side button)" })
hl.bind("CTRL + ALT + mouse:275", hl.dsp.focus({ workspace = "r+1"}), { description = "Move to the previous workspace (mouse side button)" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1"}), { description = "Move to the next active workspace (mouse)" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1"}), { description = "Move to the previous active workspace (mouse)" })


-- Move window to workspace
hl.bind("CTRL + ALT + SHIFT + Down", hl.dsp.window.move({ workspace = "+1"}), { description = "Move the current window to the next workspace" })
hl.bind("CTRL + ALT + SHIFT + Up", hl.dsp.window.move({ workspace = "-1"}), { description = "Move the current window to the previous workspace" })

for i = 1, 10 do
    hl.bind(mainMod .." + SHIFT + " .. (i % 10), function()
        hl.dispatch(hl.dsp.window.move({ workspace = i }))
    end, { description = "Workspace: Move window to " .. i })
end

-- Manipulate windows within the current workspace
for i = 1, 4 do
    local arrowkey = { "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind(mainMod .. " + SHIFT + " .. arrowkey[i], hl.dsp.window.swap({ direction = focusdir[i] }),
        { description = "Window: Swap the current window with the one to the " .. arrowkey[i] })
end

-- LOCKSCREEN
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session && openrgb -m static -c 220000"), { description = "Lock the screen and set the led strip to red" })

------------------------
-- SPECIAL WORKSPACES --
------------------------

-- Magic
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "Open the magic workspace" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }), { description = "Move the current window to the magic workspace" })

-- Music
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"), { description = "Open the music workspace" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }), { description = "Move the current window to the music workspace" })


--------------------
-- RESIZE WINDOWS --
--------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move the window with the left click" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize the window with the right click" })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { description = "Resize the window with shift and the left click" })
hl.bind(mainMod .. " + SHIFT + mouse:273", hl.dsp.window.resize(), { description = "Resize the window with shift and the right click" })

------------------------
-- SUBMAP - EDIT MODE --
------------------------

hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.submap("󰏫 Edit"), { description = "Enter resize mode" })
hl.define_submap("󰏫 Edit", function ()
    local regularResize = 30
    local fineResize = 10

    -- regular resize
    hl.bind("right", hl.dsp.window.resize({ x = regularResize, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -regularResize, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = regularResize, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -regularResize, relative = true}), { repeating = true })

    -- shift for fine resize
    hl.bind("SHIFT + right", hl.dsp.window.resize({ x = fineResize, y = 0, relative = true}), { repeating = true })
    hl.bind("SHIFT + left", hl.dsp.window.resize({ x = -fineResize, y = 0, relative = true}), { repeating = true })
    hl.bind("SHIFT + up", hl.dsp.window.resize({ x = 0, y = fineResize, relative = true}), { repeating = true })
    hl.bind("SHIFT + down", hl.dsp.window.resize({ x = 0, y = -fineResize, relative = true}), { repeating = true })

    -- move windows
    for i = 1, 10 do
        hl.bind(tostring(i % 10), hl.dsp.window.move({ workspace = i, follow = true }), { description = "Move window to workspace " .. i })
        hl.bind("SHIFT + " .. tostring(i % 10), hl.dsp.window.move({ workspace = i, follow = false }), { description = "Move window to workspace without following it" .. i })

    end

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { description = "Exit edit mode" })
    hl.bind("RETURN", hl.dsp.submap("reset"), { description = "Exit edit mode" })
    -- hl.bind("catchall", hl.dsp.submap("reset"), { description = "Exit edit mode" })

end)

-------------------------
-- SUBMAP - AUDIO MODE --
-------------------------

hl.bind(mainMod .. " + SHIFT + XF86AudioPlay", hl.dsp.submap(" Audio"), { description = "Enter audio mode" })

hl.define_submap(" Audio", function ()

    for i = 1, 10 do
        hl.bind(tostring(i % 10), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0." .. i), { description = "Set audio volume to " .. i })
        hl.bind("SHIFT + " .. tostring(i % 10), hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SOURCE@ 0." .. i), { description = "Set microphone volume to " .. i })
    end

    hl.bind("right", hl.dsp.exec_cmd("playerctl next"), { description = "Next song" })
    hl.bind("left", hl.dsp.exec_cmd("playerctl previous"), { description = "Prev song" })

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { description = "Exit audio mode" })
    hl.bind("RETURN", hl.dsp.submap("reset"), { description = "Exit audio mode" })
    -- hl.bind("catchall", hl.dsp.submap("reset"), { description = "Exit audio mode" })
end)

----------------------------
-- LAPTOP MULTIMEDIA KEYS --
----------------------------

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { description = "Increase audio volume", repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { description = "Decrease audio volume", repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { description = "Mute audio", locked = true })
hl.bind(mainMod .. "+ SHIFT + O", hl.dsp.exec_cmd("~/.config/waybar/scripts/audioOutputSwitcher.py"), { description = "Switch audio output" })
hl.bind(mainMod .. "+ SHIFT + I", hl.dsp.exec_cmd("~/.config/hypr/scripts/micSwitcher.py"), { description = "Switch audio input" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { description = "Toggle mute microphone" })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10% --min-value=2"), { description = "Increase brightness", repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%- --min-value=2"), { description = "Decrease brightness", repeating = true })

-- Keyboard backlight
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10% --device=platform::kbd_backlight"), { description = "Increase brightness", repeating = true })
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%- --device=platform::kbd_backlight"), { description = "Decrease brightness", repeating = true })

-- Song controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Next song" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous song" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle song play" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle song play" })

-- Alternative for keyboard with no next/prev/play/pause keys
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("playerctl next"), { description = "Next song" })
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous song" })
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle song play" })

---------------
-- BLUETOOTH --
---------------
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("kitty --class=\"kitty-waybar-tool\" bluetuith"), { description = "Description" })

------------------------
-- NOTIFICATION UTILS --
------------------------
hl.bind("CTRL + ALT + B", hl.dsp.exec_cmd("notify-send -e -u critical -r 1 --icon=\"battery\" \"Battery\" \"$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk -F': *' '/percentage/ { print $2 }')\""), { description = "Send a notification with the battery level" })
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("notify-send -e -u critical -r 1 --icon=\"clock\" \"$(date +'%B %d')\" \"$(date +'%A - %H:%M')\""), { description = "Send a notification with the current time" })


----------------
-- SCREENSHOT --
----------------
hl.bind("print", hl.dsp.exec_cmd("hyprshot -z -m output -o ~/Pictures/Screenshots/"), { description = "Screenshot of a window" })
hl.bind("ALT + print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh output"), { description = "Screenshot of the whole screen" })
hl.bind("SHIFT + print", hl.dsp.exec_cmd("hyprshot -z -m region -o ~/Pictures/Screenshots/"), { description = "Screenshot of a region" })
hl.bind("ALT + SHIFT + print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh region"), { description = "Screenshot of a region" })

hl.bind("CTRL + print", hl.dsp.exec_cmd("hyprshot -z -m window -o ~/Pictures/Screenshots/"), { description = "Screenshot of a monitor (choose which one)" })
hl.bind("CTRL + ALT + print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh window"), { description = "Screenshot of a monitor (choose which one)" })

----------
-- APPS --
----------

hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("org.keepassxc.KeePassXC || keepassxc"), { description = "Launch keepass" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"), { description = "Open the browser" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(changeWorkspace(3) .." && pgrep -x obsidian || flatpak run md.obsidian.Obsidian || obsidian"), { description = "Switch to workspace 3 and open obsidian" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(mailClient), { description = "Open the mail client" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(changeWorkspace(6)), { description = "Switch to workspace 6 (chat)" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(changeWorkspace(4)), { description = "Switch to workspace 4 (git)" })

---------------
-- UTILITIES --
---------------
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/restart-waybar.sh & swaync-client -rs"), { description = "Restart waybar and swaync" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/setWaybarDark.sh"), { description = "Set waybar dark theme" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Open notification center" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -d -sw"), { description = "Toggle Do not disturb" })
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("kitty --class=\"kitty-waybar-tool\" nmtui"), { description = "Open nmtui" })
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("wlogout"), { description = "Open wlogout menu" })
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd("~/.config/rofi/scripts/emoji-picker"), { description = "Open emoji picker" })
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("cliphist list | " .. menu .." -dmenu | cliphist decode | wl-copy"), { description = "Description" })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(changeWorkspace(2)), { description = "Change to workspace 2 (code)" })
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(" ~/.config/hypr/scripts/vscode-recent-rofi.sh"), { description = "Open rofi recent projects" })
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("bongocat -c ~/.config/bongocat/bongocat.conf -w -t"), { description = "Toggle bongocat" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator || galculator"), { description = "Open calculator" })
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("hyprpicker -a && notify-send \" Color copied to clipboard\" \"$(wl-paste)\" -e"), { description = "Open hyprpicker and copy the result to the clipboard" })


-- Power button
hl.on("hyprland.start", function ()
  hl.exec_cmd("systemd-inhibit --who=\"Hyprland config\" --why=\"wlogout keybind\" --what=handle-power-key --mode=block sleep infinity & echo $! > /tmp/.hyprland-systemd-inhibit")
end)

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("pgrep -a wlogout && killall -w wlogout || wlogout"), { description = "Toggle Wlogout" })
hl.on("hyprland.shutdown", function ()
  hl.exec_cmd([[kill -9 "$(cat /tmp/.hyprland-systemd-inhibit)"]])
end)
