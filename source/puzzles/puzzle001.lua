import "../elements/button"
import "../elements/toggle"

-- split state from drawing for testability

Puzzle001 = {}

function Puzzle001:new()
	local newObj = {
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

function Puzzle001:draw()
	for _, val in pairs(self.elements) do
		val:draw(val.x, val.y)
	end
end

function Puzzle001:logic(btn_just_pressed)
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

function Puzzle001:run(btn_just_pressed)
	self:logic(btn_just_pressed)
	self:draw()
end

function Puzzle001:runWrapper()
	if playdate.buttonJustPressed( playdate.kButtonUp ) then
		self:run( playdate.kButtonUp )
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		self:run( playdate.kButtonDown )
	end
	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		self:run( playdate.kButtonLeft )
	end
	if playdate.buttonJustPressed( playdate.kButtonRight ) then
		self:run( playdate.kButtonRight )
	end
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		self:run( playdate.kButtonA )
	end
	if playdate.buttonJustPressed( playdate.kButtonB ) then
		self:run( playdate.kButtonB )
	end
end
