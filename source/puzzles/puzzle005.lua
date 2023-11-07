local gfx <const> = playdate.graphics

import "../elements/button"
import "../elements/dial"
import "../elements/light"


-- ToDo
-- clean up, optimize, refactor, etc etc
-- how much logic in the setup and how much in the logic?



Puzzle005 = {}

function Puzzle005:new()
    local newObj = {
		elements = {
			dial_left = RoundDial:new(60, 95, 195, true),
			button_left = Button:new(28, 145, true),
			dial_right = SquareDial:new(340, 95, 0, false),
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

function Puzzle005:run()
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self.elements.button_right:toggle()
		self.elements.dial_right:toggle()
	end
	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self.elements.button_left:toggle()
		self.elements.dial_left:toggle()
	end

	if self.elements.dial_left.angle >= 185 and self.elements.dial_left.angle <= 200 and
		self.elements.light_1.on == false then
		self.elements.light_1:toggle()
	end

	if (self.elements.dial_left.angle < 185 or self.elements.dial_left.angle > 200) and
		self.elements.light_1.on == true then
		self.elements.light_1:toggle()
	end

	if self.elements.dial_right.angle >= 50 and self.elements.dial_right.angle <= 80 and
		self.elements.light_3.on == false then
		self.elements.light_3:toggle()
	end

	if (self.elements.dial_right.angle < 50 or self.elements.dial_right.angle > 80) and
		self.elements.light_3.on == true then
		self.elements.light_3:toggle()
	end

	if math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) <= 45 and
		self.elements.light_2.on == false then
		self.elements.light_2:toggle()
	end

	-- bug: middle light does not light up when dials are on opposite sides of zero
	-- could be an interesting bug to keep in
	-- solution: <= 45 or > 315
	-- tests would be useful here!
	-- 30 might be sufficient, but it's nice it lights up for longer than the other two

	if math.abs(self.elements.dial_left.angle - self.elements.dial_right.angle) > 45 and
		self.elements.light_2.on == true then
		self.elements.light_2:toggle()
	end

	local crank_change = playdate.getCrankChange()
	-- Does it make sense to have the enabled check in the dial?
	self.elements.dial_left:rotate(crank_change)
	self.elements.dial_right:rotate(crank_change)


	self:draw()
end

