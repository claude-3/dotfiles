-- ショートカットキーとアプリの紐付け設定
-- --------------------
local app_map = {}

local mash = { "ctrl", "shift" }

local function registerAppLauncer(modifier, app)
	table.insert(app_map, string.lower(modifier) .. " - " .. app)
	hs.hotkey.bind(mash, modifier, function()
		-- hs.alert.show('Cmd + Ctrl + '..modifier, 2) -- 動作確認用
		hs.application.launchOrFocus(app)
	end)
end

registerAppLauncer("C", "Google Chrome")
-- registerAppLauncer("I", "iterm")
registerAppLauncer("N", "Notion")
registerAppLauncer("T", "Alacritty")

-- IME切り替え
-- --------------------
local simpleCtrl = false
local map = hs.keycodes.map
local function eikanaEvent(event)
	local c = event:getKeyCode()
	local f = event:getFlags()
	if event:getType() == hs.eventtap.event.types.keyDown then
		if f["ctrl"] then
			simpleCtrl = true
		end
	elseif event:getType() == hs.eventtap.event.types.flagsChanged then
		if not f["ctrl"] then
			if simpleCtrl == false then
				if c == map["ctrl"] then
					hs.keycodes.setMethod("Alphanumeric (Google)")
				end
			end
			simpleCtrl = false
		end
	end
end

anmode = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged }, eikanaEvent)
anmode:start()
