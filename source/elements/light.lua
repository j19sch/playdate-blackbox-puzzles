local gfx <const> = playdate.graphics

Light = {}

function Light:new(x_pos, y_pos, on, index)
    local on_image = gfx.image.new("assets/images/light-alt-on.png")
    assert(on_image, "could not load image for light on")

    local off_image = gfx.image.new("assets/images/light-alt-off.png")
    assert(off_image, "could not load image for light off")

    local img
    if on == true then
        img = on_image
    else
        img = off_image
    end

    local newObj = {
        x = x_pos,
        y = y_pos,
        on = on,
        image_on = on_image,
        image_off = off_image,
        image = img,
        index = index
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Light:draw()
    self.image:draw(self.x, self.y)
end

function Light:toggle()
    self.on = not self.on

    if self.on == true then
        self.image = self.image_on
    else
        self.image = self.image_off
    end
end
