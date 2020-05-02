function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  -- hs.alert.show(hs.spotify.getPlaybackState())
  hs.spotify.displayCurrentTrack()
end)

caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/assets/highlightactive.png")
    else
        caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/assets/highlighted.png")
    end
end
--fak

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
