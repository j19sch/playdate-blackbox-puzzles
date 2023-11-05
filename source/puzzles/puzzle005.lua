local gfx <const> = playdate.graphics

import "../elements/dial"


-- ToDo
-- make it a puzzle
-- make the dial multigonal instead of circle-ish
-- decide how to deal with getting crank out and putting it back


Puzzle005 = {}

function Puzzle005:new()
    local newObj = {
		elements = {
			dial_1 = Dial:new(80, 120, 0),
			dial_2 = Dial2:new(200, 120, 0),
			dial_3 = Dial3:new(320, 120, 0)
		},
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle005:draw()
	playdate.graphics.clear()

	gfx.drawText("Playdate BlackBox Puzzle 005", 5, 5)

	for _, val in pairs(self.elements) do
		val:draw()
	end

end

function Puzzle005:run()
	local crank_pos = playdate.getCrankPosition()
	crank_pos = math.floor(crank_pos)

	self.elements.dial_1:rotate_to(crank_pos)
	self.elements.dial_2:rotate_to(crank_pos)
	self.elements.dial_3:rotate_to(crank_pos)

	self:draw()
	gfx.drawText(tostring(crank_pos), 15, 25)
end
