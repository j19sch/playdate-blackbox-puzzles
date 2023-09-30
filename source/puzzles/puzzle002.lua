import "../elements/circle"
import "../elements/toggle"

local gfx <const> = playdate.graphics

Puzzle002 = {}

function Puzzle002:new(crank_pos)
    local newObj = {
		elements = {
			circle = Circle:new(150, 140, crank_pos / 4, true),
			toggle = Toggle:new(300, 105, "right")
		}
    }
    self.__index = self
    return setmetatable(newObj, self)
end


function Puzzle002:draw(crank_pos)
	gfx.drawText(crank_pos, 15, 35)

	self.elements.circle.r = crank_pos / 4

	for _, val in pairs(self.elements) do
		val:draw()
	end
end

function Puzzle002:logic(btn_just_pressed)
	if btn_just_pressed == playdate.kButtonA then
		self.elements.toggle:flip()
		if self.elements.circle.fill == true then
			self.elements.circle.fill = false
		else
			self.elements.circle.fill = true
		end
	end
end

function Puzzle002:run(btn_just_pressed)
	self:logic(btn_just_pressed)
	self:draw()
end
