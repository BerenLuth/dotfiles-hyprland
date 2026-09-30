-----------------------
-- TRACKPAD GESTURES --
-----------------------

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })


hl.gesture({
    fingers = 3,
    direction = "right",
    action = function()
      hl.dispatch(hl.dsp.focus({ direction = "l" }))
    end })
hl.gesture({ fingers = 3, direction = "left", action = function()
      hl.dispatch(hl.dsp.focus({ direction = "r" }))
    end })

hl.gesture({ fingers = 4, direction = "vertical", action = "special", workspace_name="magic" })

hl.gesture({ fingers = 4, direction = "vertical", mods = "CTRL", action = "special", workspace_name="music" })

hl.gesture({ fingers = 4, direction = "up", mods = "SUPER", action = "cursorZoom", zoom_level = 2.5, mode = "mult" })

hl.gesture({ fingers = 4, direction = "down", mods = "SUPER", action = "cursorZoom", zoom_level = -1, mode = "mult" })

-- 4 fingers horizontal right jumps between the current workspace and the previous one
hl.gesture({ fingers = 4, direction = "right", action = function()
    hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
end })

-- 4 fingers horizontal left: similar to the right, but jumps between chat workspace and the previous
hl.gesture({
    fingers = 4,
    direction = "left",
    action = function()
        local workspace = hl.get_active_workspace();
        if workspace.id == 6 then
          hl.dispatch(hl.dsp.focus({ workspace = "previous" }))

        else
          hl.dispatch(hl.dsp.focus({ workspace = 6 }))
        end
    end })

---------------------------
-- MOUSE WHEELS GESTURES --
---------------------------
local mainMod = "SUPER"
---

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1"}), { description = "Move to the next active workspace (mouse)" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }),
    { description = "Move to the previous active workspace (mouse)" })
hl.bind(mainMod .. " + mouse_right", hl.dsp.focus({ direction = "r" }),
    { description = "Mouse horizontal wheel to move the focus to the right" })

hl.bind(mainMod .. " + mouse_left", hl.dsp.focus({ direction = "l" }),
    { description = "Mouse horizontal wheel to move the focus to the left" })
