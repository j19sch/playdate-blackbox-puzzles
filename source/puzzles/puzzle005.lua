local gfx <const> = playdate.graphics

import "../elements/button"
import "../elements/dial"
import "../elements/light"


Puzzle005 = {}

function Puzzle005:new()
    local newObj = {
		elements = {
			dial_left = Dial:new(60, 95, 180, "round", true),
			button_left = Button:new(28, 145, true),
			dial_right = Dial:new(340, 95, 0, "square", false),
			button_right = Button:new(308, 145, false),
			light_1 = Light:new(168, 26,true, 1),
			light_2 = Light:new(168, 96,false, 1),
			light_3 = Light:new(168, 166,false, 1),
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

function Puzzle005:toggle_left_dial()
	self.elements.button_left:toggle()
	self.elements.dial_left:toggle()
end

function Puzzle005:toggle_right_dial()
	self.elements.button_right:toggle()
	self.elements.dial_right:toggle()
end

function Puzzle005:logic()
	-- many different ways to structure this logic
	if self.elements.dial_left.angle >= 170 and self.elements.dial_left.angle <= 190 then
		self.elements.light_1:be_on()
	else
		self.elements.light_1:be_off()
	end

	if self.elements.dial_right.angle >= 30 and self.elements.dial_right.angle <= 60 and
		self.elements.light_3.on == false then
		self.elements.light_3:toggle()
	end

	if (self.elements.dial_right.angle < 30 or self.elements.dial_right.angle > 60) and
		self.elements.light_3.on == true then
		self.elements.light_3:toggle()
	end

	if (math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) <= 30 or
		math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) >= 330 ) and
		self.elements.light_2.on == false then
		self.elements.light_2:toggle()
	end

	if (math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) > 30 and
		math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) < 330) and
		self.elements.light_2.on == true then
		self.elements.light_2:toggle()
	end
end

function Puzzle005:run()
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self:toggle_right_dial()
	end
	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self:toggle_left_dial()
	end

	local crank_change = playdate.getCrankChange()
	self.elements.dial_left:rotate(crank_change)
	self.elements.dial_right:rotate(crank_change)

	self:logic()

	self:draw()
end

