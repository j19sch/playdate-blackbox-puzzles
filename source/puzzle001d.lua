local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- separate logic completely from button presses,
-- by making elements responsible for their logic

Puzzle001d = {}

function Puzzle001d:new()
    newObj = {
    	elements = {
			button_top = Button:new(80, 60, false),
			button_left = Button:new(15, 92, false),
			button_bottom = Button:new(80, 125, false),
			button_right = Button:new(145, 92, false),
			toggle_vert = Toggle:new(320, 92, "up"),
			toggle_hor = Toggle:new(240, 91, "right")
		}
    }
    self.__index = self
    return setmetatable(newObj, self)
end


function Puzzle001d:draw()
	for key, val in pairs(self.elements) do
		val:draw(val.x, val.y)
	end
end


-- todo: you togggle a button and you flip a toggle,
-- need to replace a toggle

function Puzzle001d:toggle_button_top()
	if self.elements.toggle_vert.flipped == true then
		self.elements.button_top:toggle()
	end
end

function Puzzle001d:toggle_button_bottom()
	if self.elements.toggle_vert.flipped == true then
		self.elements.button_bottom:toggle()
	end
end

function Puzzle001d:toggle_button_left()
	if self.elements.toggle_vert.flipped == false then
		self.elements.button_left:toggle()
	end
end

function Puzzle001d:toggle_button_right()
	if self.elements.toggle_vert.flipped == false then
		self.elements.button_right:toggle()
	end
end

function Puzzle001d:flip_toggle_vert()
	self.elements.toggle_vert:flip()
end

function Puzzle001d:flip_toggle_hor()
	self.elements.toggle_hor:flip()
end


function Puzzle001d:run()
    if playdate.buttonJustPressed( playdate.kButtonUp ) then
		self:toggle_button_top()
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		self:toggle_button_bottom()
	end
	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
   		self:toggle_button_left()
	end
	if playdate.buttonJustPressed( playdate.kButtonRight ) then
		self:toggle_button_right()
	end
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self:flip_toggle_vert()
	end
	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self:flip_toggle_hor()
	end
	self:draw()
end
