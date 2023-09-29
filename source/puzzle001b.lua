local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- implementation using input handlers

Puzzle001b = {}

function Puzzle001b:new()
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

function Puzzle001b:addInputHandlers()
	self.input_handlers = {}
	self.input_handlers.one = {
		-- toggle_vert.flipped == false
		AButtonDown = function()
			self.elements.toggle_vert:flip_and_draw()
			playdate.inputHandlers.push(self.input_handlers.two)
		end,
		BButtonDown  = function()
			self.elements.toggle_hor:flip_and_draw()
		end,
		leftButtonDown  = function()
			self.elements.button_left:toggle_and_draw()
		end,
		rightButtonDown  = function()
			self.elements.button_right:toggle_and_draw()
		end,
		-- alternative: masksPreviousHandlers
		upButtonDown  = function()
		end,
		downButtonDown  = function()
		end
	}
	self.input_handlers.two = {
		-- toggle_vert.flipped == true
		AButtonDown = function()
			self.elements.toggle_vert:flip_and_draw()
			playdate.inputHandlers.push(self.input_handlers.one)
		end,
		BButtonDown  = function()
			self.elements.toggle_hor:flip_and_draw()
		end,
		upButtonDown  = function()
			self.elements.button_top:toggle_and_draw()
		end,
		downButtonDown  = function()
			self.elements.button_bottom:toggle_and_draw()
		end,
		-- alternative: masksPreviousHandlers
		leftButtonDown = function()
		end,
		rightButtonDown = function()
		end,
	}
	playdate.inputHandlers.push(self.input_handlers.one)
end

function Puzzle001b:draw()
	for key, val in pairs(self.elements) do
		val:draw(val.x, val.y)
	end
end
