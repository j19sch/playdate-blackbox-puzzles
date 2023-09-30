import "../elements/button"
import "../elements/toggle"

-- initial implementation, not considering testability

Puzzle001a = {}

function Puzzle001a:new()
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


function Puzzle001a:draw()
	for _, val in pairs(self.elements) do
		val:draw(val.x, val.y)
	end
end

function Puzzle001a:run()
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
