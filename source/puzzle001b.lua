local gfx <const> = playdate.graphics

import "button"
import "toggle"

-- use input handlers

Puzzle001b = {}

function Puzzle001b:new()
    newObj = {
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle001b:init()
	self.elements = {}
	self.elements.button_top = Button:new(80, 40, false)

	self.elements.button_left = Button:new(15, 72, false)

	self.elements.button_bottom = Button:new(80, 105, false)

	self.elements.button_right = Button:new(145, 72, false)

	self.elements.toggle_vert = Toggle:new(300, 40, "up")
	self.elements.toggle_hor = Toggle:new(300, 105, "right")

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
		val.image:draw(val.x, val.y)
	end
end