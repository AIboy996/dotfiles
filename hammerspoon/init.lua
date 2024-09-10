local notch = 0
-- 左右分屏
hs.hotkey.bind({ "cmd", "shift" }, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    if (hs.screen.mainScreen() == hs.screen("Redmi")) then
        notch = 35
    else
        notch = 0
    end
    f.x = max.x
    f.y = max.y + notch
    f.w = max.w / 2
    f.h = max.h - notch
    win:setFrame(f)
end)
hs.hotkey.bind({ "cmd", "shift" }, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    if (hs.screen.mainScreen() == hs.screen("Redmi")) then
        notch = 35
    else
        notch = 0
    end
    f.x = max.x + (max.w / 2)
    f.y = max.y + notch
    f.w = max.w / 2
    f.h = max.h - notch
    win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "shift" }, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    if (hs.screen.mainScreen() == hs.screen("Redmi")) then
        notch = 35
    else
        notch = 0
    end
    f.x = max.x
    f.y = max.y + notch
    f.w = max.w
    f.h = max.h - notch
    win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "shift" }, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 6)
    f.y = max.y + (max.w / 10)
    f.w = max.w / 1.5
    f.h = max.h / 1.5
    win:setFrame(f)
end)

local function moveChatGPT()
    local targetFrame = hs.application.applicationsForBundleID("ru.keepcoder.Telegram")[1]:focusedWindow():frame()
    local gpt = hs.application.applicationsForBundleID("com.openai.chat")[1]:allWindows()[1]
    targetFrame.y = targetFrame.y + targetFrame.h
    targetFrame.h = targetFrame.h / 2
    gpt:setFrame(targetFrame)
end

local telegramWindowFilter = hs.window.filter.new(false):setAppFilter('Telegram')
telegramWindowFilter:subscribe(hs.window.filter.windowMoved, moveChatGPT)

local function reloadConfig(files)
    local doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then doReload = true end
    end
    if doReload then hs.reload() end
end

Watcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/",
    reloadConfig):start()
hs.alert.show("Hamerspoon Config reloaded")
