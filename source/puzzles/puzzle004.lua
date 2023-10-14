local gfx <const> = playdate.graphics

import "CoreLibs/animation"

import "../elements/button"  -- should use a light instead


Puzzle004 = {}

function Puzzle004:new()
    local newObj = {
		elements = {
			button_1 = Button:new(25, 92, false),
			button_2 = Button:new(95, 92, false),
			button_3 = Button:new(165, 92, false),
			button_4 = Button:new(235, 92, false),
			button_5 = Button:new(305, 92, false)
		},
		blinker = gfx.animation.blinker.new(500, 500, true, 5, true),
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle004:draw()
	gfx.drawText("Playdate BlackBox Puzzle 004", 5, 5)
	for _, val in pairs(self.elements) do
		val:draw()
	end
end

-- function Puzzle004:logic()
-- end


function Puzzle004:run()
	self:draw()
end