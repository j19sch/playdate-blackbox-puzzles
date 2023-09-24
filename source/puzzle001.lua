local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- initial implementation

Puzzle001 = {}

function Puzzle001:new()
    newObj = {
    	elements = {
			button_top = Button:new(80, 40, false),
			button_left = Button:new(15, 72, false),
			button_bottom = Button:new(80, 105, false),
			button_right = Button:new(145, 72, false),
			toggle_vert = Toggle:new(300, 40, "up"),
			toggle_hor = Toggle:new(300, 105, "right")
    	}
    }
    self.__index = self
    return setmetatable(newObj, self)
end


function Puzzle001:draw()
	for key, val in pairs(self.elements) do
		val:draw(val.x, val.y)
	end
end

function Puzzle001:run()
	if self.elements.toggle_vert.flipped == true then
	    if playdate.buttonJustPressed( playdate.kButtonUp ) then
    		self.elements.button_top:toggle_and_draw()
    	end
    	if playdate.buttonJustPressed( playdate.kButtonDown ) then
    		self.elements.button_bottom:toggle_and_draw()
    	end
	else
	    if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		   	self.elements.button_left:toggle_and_draw()
    	end
    	if playdate.buttonJustPressed( playdate.kButtonRight ) then
	   		self.elements.button_right:toggle_and_draw()
		end
	end

    if playdate.buttonJustPressed( playdate.kButtonA) then
    	self.elements.toggle_vert:flip_and_draw()
	end

    if playdate.buttonJustPressed( playdate.kButtonB) then
    	self.elements.toggle_hor:flip_and_draw()
	end
end
