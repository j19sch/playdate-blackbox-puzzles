local gfx <const> = playdate.graphics

Dial = {}

function Dial:new(x_pos, y_pos, start_angle, shape, enabled)
    local image_table = {
        square = "dial-square.png",
        round = "dial-round.png"
    }

    local img = gfx.image.new("assets/images/" .. image_table[shape])
    assert(img, "could not load image for dial")

    local newObj = {
        x = x_pos,
        y = y_pos,
        angle = start_angle,
        enabled = enabled,
        image = img
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Dial:draw()
    self.image:drawRotated(self.x, self.y, self.angle)
end

function Dial:toggle()
    self.enabled = not self.enabled
end

function Dial:rotate(delta)
    -- convinced and not convinced this is where to check for enabled
    if self.enabled == true then
        self.angle = (self.angle + delta) % 360
    end
end
