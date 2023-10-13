local gfx <const> = playdate.graphics

import "../elements/circle"
import "../elements/toggle"


Puzzle003 = {}

function Puzzle003:new()
    local newObj = {
		elements = {
			circle = Circle:new(150, 140, 10, true),
			toggle = Toggle:new(300, 105, "right")
		}
    }
    self.__index = self
    return setmetatable(newObj, self)
end


function Puzzle003:draw(is_crank_docked, latest_crank_change)
	-- Suboptimal code to preserve the bug where the puzzle title
	-- disappears when you rotate the crank.
	if is_crank_docked == true then
		playdate.graphics.clear()
		gfx.drawText("Playdate BlackBox Puzzle 003", 5, 5)
		gfx.drawText(tostring(latest_crank_change), 15, 35)
	elseif is_crank_docked == false and latest_crank_change ~= 0 then
		playdate.graphics.clear()
		gfx.drawText(tostring(latest_crank_change), 15, 35)
	elseif is_crank_docked == false and latest_crank_change == 0 then
		gfx.drawText("Playdate BlackBox Puzzle 003", 5, 5)
	end


	for _, val in pairs(self.elements) do
		val:draw()
	end
end

function Puzzle003:logic(is_crank_docked, latest_crank_change)
	-- This puzzle works differently in the simulator, since there you can click
	-- a crank position, instead of having to rotate the crank.

	if is_crank_docked == true then
		self.elements.circle.r = 10
		if self.elements.toggle.flipped == true then
			self.elements.toggle:flip()
		end
	else
		if self.elements.toggle.flipped == false then
			self.elements.toggle:flip()
		end
		self.elements.circle.r = math.abs(latest_crank_change)
		if latest_crank_change > 0 then
			self.elements.circle.fill = true
		elseif latest_crank_change < 0 then
			self.elements.circle.fill = false
		end
	end
end

function Puzzle003:run()
	local crank_docked = playdate.isCrankDocked()
	local crank_change = playdate.getCrankChange()

	self:logic(crank_docked, crank_change)
	self:draw(crank_docked, crank_change)
end
