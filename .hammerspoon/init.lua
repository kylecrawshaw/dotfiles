require "keys"
require "pomodoro"
require "random"
require "windows"

local showalerts = false
function toggleHideAlerts ()
    if showalerts then 
        showalerts = false
        hs.alert.show("No more alerts.")
    else
        showalerts = true
        hs.alert.show("Alerts enabled.")
    end
end
hs.hotkey.bind(mash.utils, "s", toggleHideAlerts)

function displayAlert(message)
    if showalerts then
        hs.alert.show("" .. message .. "")
    end
end

-- Wifi
function ssidChangedCallback()
    local ssid = hs.wifi.currentNetwork()
    if ssid and showalerts then
      displayAlert("Network connected: " .. ssid)
    end
end

hs.wifi.watcher.new(ssidChangedCallback):start()

local caffeine

function toggleCaffeine()
  setCaffeineMenuItem(hs.caffeinate.toggle("systemIdle"))
end

function setCaffeineMenuItem(state)
  if state then
    if not caffeine then
      caffeine = hs.menubar.new(false)
      -- Icon shamelessly copied from https://github.com/BrianGilbert/.hammerspoon
      caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/caffeine-on.pdf")
      caffeine:setClickCallback(toggleCaffeine)
    end

    caffeine:returnToMenuBar()
    displayAlert("Caffeinated!")
  else
    caffeine:removeFromMenuBar()
    displayAlert("Decaf")
  end
end
hs.hotkey.bind(mash.utils, "c", toggleCaffeine)




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
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
