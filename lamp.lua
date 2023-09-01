local gfx <const> = playdate.graphics


-- using inheritance
-- -----------------
-- ToDo



-- using a "class"
-- ---------------

Lamp = {}

function Lamp:new(x_pos, y_pos, image_file)
    newObj = {
        x = x_pos,
        y = y_pos,
        image = gfx.image.new("images/" .. image_file)
    }
  self.__index = self
  return setmetatable(newObj, self)
end

function Lamp:draw()
  self.image:draw(self.x, self.y)
end

-- How to tell if image has been inverted? playdate.graphics.image:sample(x, y)?
function Lamp:toggle()
    self.image = self.image:invertedImage()
end



-- using functions
-- ---------------

function define_lamp(state, x, y, image)
    local lamp = {}
    lamp['image'] = gfx.image.new("images/" .. image)
    lamp['x'] = x
    lamp['y'] = y
    lamp['image']:setInverted(state)

    return lamp
end

function draw_lamp(lamp)
    lamp['image']:draw(lamp['x'], lamp['y'])
end

function toggle_lamp(lamp)
    -- ugly, side effect, create my own lamp object instead?
    lamp['image'] = lamp['image']:invertedImage()
end


-- using drawing, which runs into problems with updates
-- function define_lamp(state, x, y, radius)
--     local lamp = {}
--     lamp['state'] = state
--     lamp['x'] = x
--     lamp['y'] = y
--     lamp['radius'] = radius

--     return lamp
-- end

-- function draw_lamp(lamp)
--     if lamp['state'] == true then
--         -- print("drawing full circle")
--         gfx.fillCircleAtPoint(lamp['x'], lamp['y'], lamp['radius'])
--     else
--         -- print("drawing empty circle")
--         gfx.drawCircleAtPoint(lamp['x'], lamp['y'], lamp['radius'])
--     end
-- end


-- function toggle_lamp(lamp)
--     if lamp['state'] == true then
--         lamp['state'] = false
--     else
--         lamp['state'] = true
--     end
-- end
