local gfx <const> = playdate.graphics

-- ToDo: less code duplication

SquareDial = {}

function SquareDial:new(x_pos, y_pos, start_angle, enabled)
    local img = gfx.image.new("assets/images/dial-v2.png")
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

function SquareDial:draw()
    self.image:drawRotated(self.x, self.y, self.angle)
end

function SquareDial:toggle()
    self.enabled = not self.enabled
end

function SquareDial:rotate(delta)
    if self.enabled == true then
        self.angle = (self.angle + delta) % 360
    end
end

function SquareDial:rotate_to(new_angle)
    if self.enabled == true then
        self.angle = new_angle
    end
end


RoundDial = {}

function RoundDial:new(x_pos, y_pos, start_angle, enabled)
    local img = gfx.image.new("assets/images/dial-v3.png")
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

function RoundDial:draw()
    self.image:drawRotated(self.x, self.y, self.angle)
end

function RoundDial:toggle()
    self.enabled = not self.enabled
end

function RoundDial:rotate(delta)
    if self.enabled == true then
        self.angle = (self.angle + delta) % 360
    end
end

function RoundDial:rotate_to(new_angle)
    if self.enabled == true then
        self.angle = new_angle
    end
end