-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}

-----------------------------------------------
-- hyper left for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    local sections

    if f.w == math.floor(max.w / 3) then
        sections = 4
    else
        sections = 3
    end

    f.x = 0 
    f.y = 0
    f.w = math.floor(max.w / sections)
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper right for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if f.x == max.w - math.floor(max.w / 3) then
        f.x = max.w - (max.w / 4)
        f.w = max.w / 4
    else
        f.x = max.w - math.floor(max.w / 3)
        f.w = max.w / 2
    end

    f.y = max.y
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper down for center
-----------------------------------------------

hs.hotkey.bind(hyper, "down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if f.w == math.floor(max.w / 2) then
        f.x = math.floor(max.w / 3) 
        f.y = 0
        f.w = math.floor(max.w / 3)
        f.h = max.h
    else
        f.x = math.floor(max.w / 4) 
        f.y = 0
        f.w = math.floor(max.w / 2)
        f.h = max.h
    end

    win:setFrame(f)
end)

-----------------------------------------------
-- hyper f for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
