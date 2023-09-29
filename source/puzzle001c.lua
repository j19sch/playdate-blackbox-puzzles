local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- use bitmasks returned by playdate.getButtonState()
-- bitmasks
-- left 1
-- right 2
-- up 4
-- down 8
-- b 16
-- a 32
-- can't do left + right or up + down
-- Playdate SDK Lua enhancements
-- &= Bitwise AND
-- |= Bitwise OR

-- from C SDK
-- ----------
-- Sets the value pointed to by current to a bitmask indicating which
-- buttons are currently down. pushed and released reflect which buttons
-- were pushed or released over the previous update cycle—at the nominal
-- frame rate of 50 ms, fast button presses can be missed if you just
-- poll the instantaneous state.

-- from Lua SDK
-- ------------
-- Implement this callback and Playdate OS will call it once per frame.
-- This is the place to put the main update-and-draw code for your game.
-- Playdate will attempt to call this function by default 30 times per
-- second; that value can be changed by calling playdate.display.setRefreshRate().

-- If your update() function takes too long to execute, Playdate OS may not be able
-- to call it as often as specified by the current refresh rate. In this case,
-- Playdate OS will simply try and call it as often as it can, with a not-to-exceed
-- rate of playdate.display.getRefreshRate() frames per second.

-- The default is 30 fps, which is a recommended figure that balances animation
-- smoothness with performance and power considerations. Maximum is 50 fps.

-- If rate is 0, playdate.update() is called as soon as a frame buffer is available. 
-- Since the display refreshes line-by-line, and unchanged lines aren’t sent to the
-- display, the update cycle will be faster than 30 times a second but at an
-- indeterminate rate. playdate.getCurrentTimeMilliseconds() should then be used as
-- a steady time base.

Puzzle001c = {}

function Puzzle001c:new()
    newObj = {
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle001c:init()
	self.elements = {
			button_top = Button:new(80, 60, false),
			button_left = Button:new(15, 92, false),
			button_bottom = Button:new(80, 125, false),
			button_right = Button:new(145, 92, false),
			toggle_vert = Toggle:new(320, 92, "up"),
			toggle_hor = Toggle:new(240, 91, "right")
	}
end

