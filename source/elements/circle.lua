local gfx <const> = playdate.graphics

Circle = {}

function Circle:new(x_pos, y_pos, radius, filled)
    newObj = {
        x = x_pos,
        y = y_pos,
        r = radius,
        fill = filled
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Circle:draw()
	if self.fill == true then
		gfx.fillCircleAtPoint(self.x, self.y, self.r)
	else
		gfx.drawCircleAtPoint(self.x, self.y, self.r)
	end
end
