local gfx <const> = playdate.graphics

Toggle = {}

-- issue with gfx.image.rotatedImage()
-- https://devforum.play.date/t/image-rotatedimage-90-offsets-crops-pixels-by-1-1-new-in-sdk-1-12/7051/3
-- drawRotated: Draws this image centered at point (x,y) at (clockwise) angle degrees

function Toggle:new(x_pos, y_pos, start_state)
    local image_table = {
        up = "toggle-up.png",
        right = "toggle-right.png",
        down = "toggle-down.png",
        left = "toggle-left.png"
    }
    local img = gfx.image.new("assets/images/" .. image_table[start_state])
    assert(img, "could not load image for tottle")
    newObj = {
        x = x_pos,
        y = y_pos,
        flipped = false,
        orientation = start_state,
        img_table = image_table,
        image = img
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Toggle:draw()
    self.image:draw(self.x, self.y)
end

function Toggle:flip()
    self.flipped = not self.flipped

    local flip_table = {
        up = "down",
        right = "left",
        down = "up",
        left = "right"
    }
    self.orientation = flip_table[self.orientation]

    self.image = gfx.image.new("assets/images/" .. self.img_table[self.orientation])
end

function Toggle:flip_and_draw()
    self:flip()
    self:draw()
end
