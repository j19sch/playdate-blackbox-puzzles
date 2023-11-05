local gfx <const> = playdate.graphics

Dial = {}

function Dial:new(x_pos, y_pos, start_angle)
    local img = gfx.image.new("assets/images/dial-v1.png")
    assert(img, "could not load image for dial")

    local newObj = {
        x = x_pos,
        y = y_pos,
        angle = start_angle,
        image = img
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Dial:draw()
    print(self.angle)
    self.image:drawRotated(self.x, self.y, self.angle)
end

function Dial:rotate_to(new_angle)
    self.angle = new_angle
end


Dial2 = {}

function Dial2:new(x_pos, y_pos, start_angle)
    local img = gfx.image.new("assets/images/dial-v2.png")
    assert(img, "could not load image for dial")

    local newObj = {
        x = x_pos,
        y = y_pos,
        angle = start_angle,
        image = img
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Dial2:draw()
    print(self.angle)
    self.image:drawRotated(self.x, self.y, self.angle)
end

function Dial2:rotate_to(new_angle)
    self.angle = new_angle
end
