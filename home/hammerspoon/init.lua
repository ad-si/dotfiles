hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({
  left = { { 'ctrl', 'alt', 'cmd' }, 'h' },
  right = { { 'ctrl', 'alt', 'cmd' }, 'l' },
  up = { { 'ctrl', 'alt', 'cmd' }, 'k' },
  down = { { 'ctrl', 'alt', 'cmd' }, 'j' },
})

hs.loadSpoon("Calendar")

hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool:start()

micMute = hs.loadSpoon("MicMute")

-- TODO: Add https://www.hammerspoon.org/Spoons/MusicAppMediaFix.html

-- MIDI devices are normally
-- 1 Network
-- 2 Bluetooth
-- 3 Attached MIDI client
-- if hs.midi.devices()[3]
-- then
--   midiDevice = hs.midi.new(hs.midi.devices()[3])

--   midiDevice:callback(
--     function(object, deviceName, commandType, description, metadata)
--       if commandType == "noteOn"
--       then
--         if metadata.note == 48 -- C3
--         then
--           hs.application.open("Brave Browser")
--         end

--         if metadata.note == 50 -- D3
--         then
--           hs.application.open("iTerm")
--         end

--         if metadata.note == 52 -- E3
--         then
--           hs.application.open("Sublime Text")
--         end

--         if metadata.note == 53 -- F3
--         then
--           hs.application.open("Thunderbird")
--         end

--         if metadata.note == 72 -- C5
--         then
--           micMute:toggleMicMute()
--         end
--       end
--     end
--   )
-- end
