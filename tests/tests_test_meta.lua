Button = {}

-- local gfx <const> = playdate.graphics

import '../button'

-- function Button:new(x_pos, y_pos, pressed)
--     local img = gfx.image.new("/images/button.png")
--     assert(img, "failed to load image for element")
--     if pressed == true then
--         img = self.image:invertedImage()
--     end
--     newObj = {
--         x = x_pos,
--         y = y_pos,
--         pressed = pressed,
--         image = img 
--     }
--     self.__index = self
--     return setmetatable(newObj, self)
-- end

-- function Button:draw()
--   self.image:draw(self.x, self.y)
-- end

-- function Button:toggle()
--     self.pressed = not self.pressed
--     self.image = self.image:invertedImage()
-- end

-- function Button:toggle_and_draw()
--     self:toggle()
--     self:draw()
-- end


function testButtonFalse()
    local button = Button:new(10, 10, false)
    luaunit.assertEquals(button.pressed, false)
end

function testButtonTrue()
    local button = Button:new(10, 10, true)
    luaunit.assertEquals(button.pressed, true)
end