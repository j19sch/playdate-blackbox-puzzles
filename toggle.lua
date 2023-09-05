local gfx <const> = playdate.graphics

Toggle = {}

-- issue with gfx.image.rotatedImage()
-- https://devforum.play.date/t/image-rotatedimage-90-offsets-crops-pixels-by-1-1-new-in-sdk-1-12/7051/3
-- drawRotated: Draws this image centered at point (x,y) at (clockwise) angle degrees

function Toggle:new(x_pos, y_pos)
    local img = gfx.image.new("images/toggle-up.png")
    newObj = {
        x = x_pos,
        y = y_pos,
        flipped = false,
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
    if self.flipped == true then
        self.image = gfx.image.new("images/toggle-down.png")
    else
        self.image = gfx.image.new("images/toggle-up.png")
    end
end

function Toggle:flip_and_draw()
    self:flip()
    self:draw()
end
