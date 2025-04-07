-- api docs see: https://www.hammerspoon.org/docs/index.html

-- 已绑定的快捷键:
-- cmd + shift + Left: 左分屏
-- cmd + shift + Right: 右分屏
-- cmd + shift + Up: 全屏
-- cmd + shift + Down: 中屏
-- cmd + shift + /: 整理窗口
-- cmd + shift + ]: 把窗口右移，并且切换到右边的space
-- cmd + shift + [: 把窗口左移，并且切换到左边的space

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

-- 整理窗口
-- local function tidy_up_window()
--     local wf = hs.window.filter
--     local pined_app = wf.new { 'QQ', '微信' }
--     for _, window in ipairs(pined_app:getWindows()) do
--         hs.spaces.moveWindowToSpace(window, hs.spaces.allSpaces()[next(hs.spaces.allSpaces())][1])
--     end
--     local work_app = wf.new { 'Google Chrome', '预览', '访达', '邮件' }
--     for _, window in ipairs(work_app:getWindows()) do
--         hs.spaces.moveWindowToSpace(window, hs.spaces.allSpaces()[next(hs.spaces.allSpaces())][2])
--     end
--     local code_app = wf.new { 'iTerm2', 'Termius', 'Code', 'Telegram' }
--     for _, window in ipairs(code_app:getWindows()) do
--         hs.spaces.moveWindowToSpace(window, hs.spaces.allSpaces()[next(hs.spaces.allSpaces())][3])
--     end
--     local re_app = wf.new { '音乐', 'Zotero', 'Calibre' }
--     for _, window in ipairs(re_app:getWindows()) do
--         hs.spaces.moveWindowToSpace(window, hs.spaces.allSpaces()[next(hs.spaces.allSpaces())][4])
--     end
--     hs.alert.show("Tidy Up Done")
-- end

-- hs.hotkey.bind({ "cmd", "shift" }, "/", tidy_up_window)


hs.hotkey.bind({ "cmd", "shift" }, "]", function()
    local target_space = hs.spaces.activeSpaceOnScreen() + 1
    hs.spaces.moveWindowToSpace(hs.window.focusedWindow(), target_space)
    hs.spaces.gotoSpace(target_space)
end)

hs.hotkey.bind({ "cmd", "shift" }, "[", function()
    local target_space = hs.spaces.activeSpaceOnScreen() - 1
    hs.spaces.moveWindowToSpace(hs.window.focusedWindow(), target_space)
    hs.spaces.gotoSpace(target_space)
end)


-- local function moveChatGPT()
--     local targetFrame = hs.application.applicationsForBundleID("ru.keepcoder.Telegram")[1]:focusedWindow():frame()
--     local gpt = hs.application.applicationsForBundleID("com.tencent.qq")[1]:allWindows()[1]
--     targetFrame.x = targetFrame.x + targetFrame.w
--     targetFrame.w = gpt:frame().w
--     gpt:setFrame(targetFrame)
--     -- gpt:focus()
-- end

-- local telegramWindowFilter = hs.window.filter.new(false):setAppFilter('Telegram')
-- telegramWindowFilter:subscribe(hs.window.filter.windowMoved, moveChatGPT)

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

-- 切换到AirPods Pro的时候自动调整音量
-- 不然真的要聋了
hs.audiodevice.watcher.setCallback(function()
    local now_device = hs.audiodevice.defaultEffectDevice()
    if now_device:name() == "yang的AirPods Pro" then
        hs.audiodevice.defaultOutputDevice():setVolume(25)
        hs.alert.show("已切换到yang的AirPods Pro")
    end
end)
hs.audiodevice.watcher.start()
