local gfx <const> = playdate.graphics

import "../elements/circle"
import "../elements/toggle"


Puzzle003 = {}

function Puzzle003:new()
    newObj = {
		elements = {
			circle = Circle:new(150, 140, 10, true),
			toggle = Toggle:new(300, 105, "right")
		}
    }
    self.__index = self
    return setmetatable(newObj, self)
end


function Puzzle003:draw()
	gfx.drawText('xyz', 15, 35)
	
	for key, val in pairs(self.elements) do
		val:draw()
	end
end

function Puzzle003:logic()
	if playdate.isCrankDocked() == true and self.elements.toggle.flipped == true then
		self.elements.toggle:flip()
	elseif playdate.isCrankDocked() == false and self.elements.toggle.flipped == false then
		self.elements.toggle:flip()
		-- ToDo
		-- self.elements.circle.fill = true
		-- self.elements.circle.r = 10
	end

	-- ToDo: simulator lets you click => one change; on the device a crank registers as multiple sequential values
	-- filter on acceleratedChange??
	-- also top value is like 38
	local crank_change, _ = playdate.getCrankChange()
	print('crank change: ' .. crank_change)
	print('abs crank change: ' .. math.abs(crank_change))
	self.elements.circle.r = math.abs(crank_change)
	if crank_change > 0 then
		self.elements.circle.fill = true
		playdate.graphics.clear()  -- only when change in value
	elseif crank_change < 0 then
		self.elements.circle.fill = false
		playdate.graphics.clear()  -- only when change in value
	end
end

function Puzzle003:run()
	self:logic()
	self:draw()
end
