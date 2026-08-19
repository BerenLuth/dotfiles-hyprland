-------------------
-- PRIVACY RULES --
-------------------

hl.window_rule({
    name = "Telegram",
    match = {
        class = "org.telegram.desktop"
    },
    no_screen_share = true,
})

hl.window_rule({
    name = "KeePassXC",
    match = {
        class = "org.keepassxc.KeePassXC"
    },
    no_screen_share = true,
})

hl.window_rule({
    name = "WhatsApp Web",
    match = {
        title = ".*WhatsApp.*"
    },
    no_screen_share = true,
})

hl.window_rule({
    name = "Gmail",
    match = {
        title = ".*Gmail.*"
    },
    no_screen_share = true,
})

hl.window_rule({
    name = "Calendar",
    match = {
        title = ".*Google Calendar.*"
    },
    no_screen_share = true,
})

hl.window_rule({
    name = "ToDo",
    match = {
        title = ".*To Do.*",
    },
    no_screen_share = true,
})
