local gfx <const> = playdate.graphics

import "CoreLibs/animation"

import "../elements/button"  -- should use a light instead


Puzzle004 = {}

function Puzzle004:new()
	local blinker = gfx.animation.blinker.new(1000, 1000, true, 6, true)
	-- cycle needs to be an even number to avoid a glitch false
	-- counter counts each true and false
	blinker:startLoop()
    local newObj = {
		elements = {
			button_1 = Button:new(25, 92, false),
			button_2 = Button:new(95, 92, false),
			button_3 = Button:new(165, 92, false),
			button_4 = Button:new(235, 92, false),
			button_5 = Button:new(305, 92, false)
		},
		-- blinker = gfx.animation.blinker.new(500, 500, true, 5, true),
		blinker = blinker
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle004:draw()
	gfx.drawText("Playdate BlackBox Puzzle 004", 5, 5)
	for _, val in pairs(self.elements) do
		val:draw()
	end
end

function Puzzle004:logic()
	print("blinker " .. "counter: " .. tostring(self.blinker.counter) .. " on: " .. tostring(self.blinker.on))
	print("blinker " .. "onDuration: " .. tostring(self.blinker.onDuration) ..
		" offDuration: " .. tostring(self.blinker.offDuration))

	if self.blinker.on == true and self.elements.button_1.pressed == false then
		self.elements.button_1:toggle()
	end
	if self.blinker.on == false and self.elements.button_1.pressed == true then
		self.elements.button_1:toggle()
	end

	self.blinker:update()
end


function Puzzle004:run()
	if playdate.buttonJustPressed( playdate.kButtonUp ) then
		print("button up")
		self.blinker.onDuration = self.blinker.onDuration + 250
		self.blinker.offDuration = self.blinker.onDuration + 250
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		print("button down")
		self.blinker.onDuration = self.blinker.onDuration - 250
		self.blinker.offDuration = self.blinker.onDuration - 250
	end
	self:logic()
	self:draw()
end
