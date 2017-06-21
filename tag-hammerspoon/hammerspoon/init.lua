-- Show arbitrary message on screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

-- Paste into things that don't allow pasting
hs.hotkey.bind({"cmd", "alt"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Reload HS config when file is modified
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
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- If leaving home, mute then volume when joining new wifi network
local wifiWatcher = nil
local homeSSID = os.getenv("WLAN_HOME")
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
