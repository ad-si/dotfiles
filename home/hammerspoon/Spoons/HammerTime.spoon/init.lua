--- === HammerTime ===
---
--- HammerTime -- A timer for the menubar
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/HammerTime.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/HammerTime.spoon.zip)
---

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "HammerTime"
obj.version = "0.1"
obj.author = "Adrian Sieber <hi@ad-si.com>"
obj.license = "ISC"
obj.homepage = "https://github.com/Hammerspoon/Spoons"

-- Settings

-- Timer duration
obj.durationInSec = hs.timer.hours(8)

-- Set this to true to always show the menubar item
obj.alwaysShow = true

-- Duration in seconds for alert to stay on screen
-- Set to 0 to turn off alert completely
obj.alertDuration = 5

-- Font size for alert
obj.alertTextSize = 80

-- Set to `nil` to turn off notification when time's up
-- or provide a hs.notify notification
obj.notification = hs.notify.new({
  title = "⌛️ Time Is Up",
  withdrawAfter = 0,
})

-- Set to `nil` to turn off notification sound when time's up
-- or provide a hs.sound
obj.sound = hs.sound.getByFile(
  "/System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds/Announcement.aiff"
)

local tickPeriodInSec = 10


function obj:init()
  self.menu = hs.menubar.new(self.alwaysShow)
  self:reset()
end


function obj:reset()
  local items = {
    { title = "Start", fn = function() self:start() end }
  }
  self.menu:setMenu(items)
  self.menu:setTitle("⏳")
  self.timerRunning = false
  if not self.alwaysShow then
      self.menu:removeFromMenuBar()
  end
end


function obj:updateTimerString()
  local secPerHour = 3600
  local hours = math.floor(self.timeLeftInSec / secPerHour)
  local minutes = math.floor((self.timeLeftInSec % secPerHour) / 60)
  local icon = "⏳"
  if not self.timerRunning then
    icon = "⏸️"
  end
  local timerString = string.format("%s %02d:%02d", icon, hours, minutes)
  self.menu:setTitle(timerString)

  local items = {
    self.timerRunning
      and { title = "⏸️ Pause",  fn = function() self:pause() end }
      or  { title = "▶️ Resume", fn = function() self:start(true) end },
    { title = "+10 min", fn = function() self:addTime(hs.timer.minutes(10)) end },
    { title = "+60 min", fn = function() self:addTime(hs.timer.minutes(60)) end },
    { title = "-10 min", fn = function() self:addTime(hs.timer.minutes(-10)) end },
    { title = "-60 min", fn = function() self:addTime(hs.timer.minutes(-60)) end },
    { title = "⏹️ Stop",  fn = function() self:reset() end }
  }
  self.menu:setMenu(items)
end


--- HammerTime:popup()
--- Method
--- Popup an alert or notification when time is up.
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function obj:popup()
  if 0 < self.alertDuration then
    hs.alert.show(
      "⌛️ Time Is Up",
      { textSize = self.alertTextSize },
      self.alertDuration
    )
  end
  if self.notification then
    self.notification:send()
  end
  if self.sound then
    self.sound:play()
  end
end


function obj:tick()
  self.timeLeftInSec = self.timeLeftInSec - tickPeriodInSec
  self:updateTimerString()
  if self.timeLeftInSec <= 0 then
    self:reset()
    self:popup()
  end
end


--- HammerTime:start()
--- Method
--- Starts the timer and displays the countdown in a menubar item
---
--- Parameters:
---  * resume - boolean when true resumes countdown
---             at current value of self.timeLeftInSec
---
--- Returns:
---  * None
function obj:start(resume)
  if not self.menu:isInMenuBar() then
    self.menu:returnToMenuBar()
  end
  if not resume then
     self.timeLeftInSec = self.durationInSec
     self:updateTimerString()
  end
  self.timerRunning = true
  self.timer = hs.timer.doWhile(
    function() return self.timerRunning end,
    function() self:tick() end,
    tickPeriodInSec
  )
  self:updateTimerString()
end


function obj:pause()
  self.timerRunning = false
  self:updateTimerString()
end


function obj:addTime(seconds)
  self.timeLeftInSec = self.timeLeftInSec + seconds
  self:updateTimerString()
end


return obj
