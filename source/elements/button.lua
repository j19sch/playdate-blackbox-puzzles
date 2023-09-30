local gfx <const> = playdate.graphics


-- using inheritance
-- -----------------
-- ToDo



-- using a "class"
-- ---------------

Button = {}

function Button:new(x_pos, y_pos, pressed)
    local img = gfx.image.new("assets/images/button.png")
    if pressed == true then
        img = img:invertedImage()
    end
    assert(img, "failed to load image for button element")

    local newObj = {
        x = x_pos,
        y = y_pos,
        pressed = pressed,
        image = img
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Button:draw()
  self.image:draw(self.x, self.y)
end

function Button:toggle()
    self.pressed = not self.pressed
    self.image = self.image:invertedImage()
end

function Button:toggle_and_draw()
    self:toggle()
    self:draw()
end
