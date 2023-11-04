local gfx <const> = playdate.graphics

import "CoreLibs/animation"

import "../elements/light"


Puzzle004 = {}

function Puzzle004:new()
	local blinker = gfx.animation.blinker.new(1000, 1000, true, 10, false)
	-- cycle needs to be an even number to avoid a glitch false
	-- counter decreases on each true and each false
	blinker:startLoop()
    local newObj = {
		elements = {
			-- this could be an array / list instead,
			-- which would remove the need for the index on Lights
			light_1 = Light:new(15, 100, false, 1),
			light_2 = Light:new(90, 100, false, 2),
			light_3 = Light:new(165, 100, false, 3),
			light_4 = Light:new(240, 100, false, 4),
			light_5 = Light:new(315, 100, false, 5)
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

	for _, val in pairs(self.elements) do
		val:draw()
	end

    if self.debug_cycles == true then
		gfx.drawText(tostring(self.blinker.cycles), 140, 50)
    end
    if self.debug_duration == true then
        gfx.drawText(tostring(self.blinker.onDuration), 230, 50)
    end
end

function Puzzle004:increase_duration()
	if self.blinker.onDuration >= 9250 then
		self.blinker.onDuration = 9250
	else
		self.blinker.onDuration = self.blinker.onDuration + 250
	end

	self.blinker.offDuration = self.blinker.onDuration
end

function Puzzle004:decrease_duration()
	if self.blinker.onDuration <= 250 then
		self.blinker.onDuration = 250
	else
		self.blinker.onDuration = self.blinker.onDuration - 250
	end

	self.blinker.offDuration = self.blinker.onDuration
end

function Puzzle004:increase_cycles()
	if self.blinker.cycles >= 22 then
		self.blinker.cycles = 22
	else
		self.blinker.cycles += 2
	end
end

function Puzzle004:decrease_cycles()
	if self.blinker.cycles <= 0 then
		self.blinker.cycles = 0
	else
		self.blinker.cycles -= 2
	end
end

function Puzzle004:toggle_debug_duration()
	self.debug_duration = not self.debug_duration
end

function Puzzle004:toggle_debug_cycles()
	self.debug_cycles = not self.debug_cycles
end

function Puzzle004:update_lights()
	for _, light in pairs(self.elements) do
		if light.index <= (self.blinker.counter + 1 ) / 2 then
			if self.blinker.on == true and light.on == false then
				light:toggle()
			end
			if self.blinker.on == false and light.on == true then
				light:toggle()
			end
		elseif light.on == true then
			light:toggle()
		end
	end
end

function Puzzle004:run()
	if playdate.buttonJustPressed( playdate.kButtonUp ) then
		self:increase_duration()
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		self:decrease_duration()
	end
	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		self:decrease_cycles()
	end
	if playdate.buttonJustPressed( playdate.kButtonRight ) then
		self:increase_cycles()
	end
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self:toggle_debug_duration()
	end
	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self:toggle_debug_cycles()
	end

	self:update_lights()

	self.blinker:update()

	self:draw()
end
