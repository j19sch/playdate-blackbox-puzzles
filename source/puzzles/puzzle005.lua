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
			dial = Dial:new(120, 120, 0)
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

	self.elements.dial:rotate_to(crank_pos)

	self:draw()
	gfx.drawText(tostring(crank_pos), 15, 25)
end
