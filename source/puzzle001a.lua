local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- split state from drawing

Puzzle001a = {}

function Puzzle001a:new()
    newObj = {
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle001a:init()
	self.elements = {}
	self.elements.button_top = Button:new(80, 40, false)

	self.elements.button_left = Button:new(15, 72, false)

	self.elements.button_bottom = Button:new(80, 105, false)

	self.elements.button_right = Button:new(145, 72, false)

	self.elements.toggle_vert = Toggle:new(300, 40, "up")
	self.elements.toggle_hor = Toggle:new(300, 105, "right")
end


function Puzzle001a:draw()
	for key, val in pairs(self.elements) do
		val.image:draw(val.x, val.y)
	end
end

function Puzzle001a:logic(btn_just_pressed)
	if self.elements.toggle_vert.flipped == true then
	    if btn_just_pressed == playdate.kButtonUp then
    		self.elements.button_top:toggle()
    	end
    	if btn_just_pressed == playdate.kButtonDown then
    		self.elements.button_bottom:toggle()
    	end
	else
	    if btn_just_pressed == playdate.kButtonLeft then
		   	self.elements.button_left:toggle()
    	end
    	if btn_just_pressed == playdate.kButtonRight then
	   		self.elements.button_right:toggle()
		end
	end

    if btn_just_pressed == playdate.kButtonA then
    	self.elements.toggle_vert:flip()
	end

    if btn_just_pressed == playdate.kButtonB then
    	self.elements.toggle_hor:flip()
	end
end

function Puzzle001a:run(btn_just_pressed)
	self:logic(btn_just_pressed)
	self:draw()
end
