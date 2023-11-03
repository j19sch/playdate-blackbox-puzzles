local gfx <const> = playdate.graphics

import "CoreLibs/animation"

import "../elements/light"


Puzzle004 = {}

function Puzzle004:new()
	local blinker = gfx.animation.blinker.new(1000, 1000, true, 10, false)
	-- cycle needs to be an even number to avoid a glitch false
	-- counter counts each true and false
	blinker:startLoop()
    local newObj = {
		elements = {
			button_1 = Light:new(25, 90, false, 1),
			button_2 = Light:new(95, 90, false, 2),
			button_3 = Light:new(165, 90, false, 3),
			button_4 = Light:new(235, 90, false, 4),
			button_5 = Light:new(305, 90, false, 5)
		},
		blinker = blinker,
		debug_cycles = false,
		debug_duration = false
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Puzzle004:draw()
	playdate.graphics.clear()
	gfx.drawText("Playdate BlackBox Puzzle 004", 5, 5)
	gfx.drawText("Press 'A' and/or 'B' to show/hide some numbers", 15, 210)
	for _, val in pairs(self.elements) do
		val:draw()
	end
	if self.debug_cycles == true then
		gfx.drawText(tostring(self.blinker.cycles), 40, 45)
	end
	if self.debug_duration == true then
		gfx.drawText(tostring(self.blinker.onDuration), 80, 45)
	end

end

function Puzzle004:logic()
	for _, light in pairs(self.elements) do
		if light.index <= (self.blinker.counter / 2) + 1 then
			if self.blinker.on == true and light.on == false then
				print("logic toggle")
				light:toggle()
			end
			if self.blinker.on == false and light.on == true then
				print("logic toggle")
				light:toggle()
			end
		elseif light.on == true then
			print("logic toggle")
			light:toggle()
		end
	end

	self.blinker:update()
end


function Puzzle004:run()
	if playdate.buttonJustPressed( playdate.kButtonUp ) then
		if self.blinker.onDuration >= 7000 then
			self.blinker.onDuration = 7000
		else
			self.blinker.onDuration = self.blinker.onDuration + 250
		end

		self.blinker.offDuration = self.blinker.onDuration
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		if self.blinker.onDuration <= 250 then
			self.blinker.onDuration = 0
		else
			self.blinker.onDuration = self.blinker.onDuration - 250
		end

		self.blinker.offDuration = self.blinker.onDuration
	end

	-- This does not work, needs reset of the blink
	if playdate.buttonJustPressed( playdate.kButtonRight ) then
		if self.blinker.cycles >= 22 then
			self.blinker.cycles = 22
		else
			self.blinker.cycles += 2
		end
	end
	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		if self.blinker.cycles <= 0 then
			self.blinker.cycles = 0
		else
			self.blinker.cycles -= 2
		end
	end

	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self.debug_duration = not self.debug_duration
	end

	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self.debug_cycles = not self.debug_cycles
	end

	self:logic()
	self:draw()
end
