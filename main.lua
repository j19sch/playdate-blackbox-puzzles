import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "lamp"

local gfx <const> = playdate.graphics

-- screen: 400 x 240

function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	gfx.drawText("Playdate Black Box Puzzles", 5, 5)
	gfx.drawText("Playdate Black Box Puzzles", 5, 20)

	-- jetbrains:drawText("Playdate Black Box Puzzles", 5, 200)

	-- lamp_1 = define_lamp(false, 100, 100, 40)
	-- draw_lamp(lamp_1)

	-- lamp_2 = gfx.image.new("images/lamp-on.png")
	-- lamp_2:draw(30, 30)
	lamp_2 = define_lamp(false, 30, 50, "lamp-on.png")
	draw_lamp(lamp_2)

	lamp_10 = Lamp:new(100, 50, "lamp-on.png")
	lamp_10:draw()

	lamp_3 = gfx.image.new("images/lamp-on.png")
	lamp_3:draw(40, 150)
	lamp_4 = gfx.image.new("images/lamp-on.png")
	lamp_4:draw(102, 155)
	-- good one: x + 63, because start at x for 64 pixels
	lamp_5 = gfx.image.new("images/lamp-on.png")
	lamp_5:draw(165, 160)
	lamp_6 = gfx.image.new("images/lamp-on.png")
	lamp_6:draw(229, 165)
	lamp_7 = gfx.image.new("images/lamp-on.png")
	lamp_7:draw(294, 170)

	-- lamp_a = {
	-- 	state = true,
	-- 	x = 100,
	-- 	y = 100,
	-- 	radius = 40
	-- }
	-- gfx.drawCircleAtPoint(lamp_a['x'], lamp_a['y'], lamp_a['radius'])
	-- gfx.fillCircleAtPoint(200, 170, 40)
	-- gfx.fillCircleAtPoint(300, 100, 40)
end

myGameSetUp()


function playdate.update()
	

    if playdate.buttonJustPressed( playdate.kButtonLeft ) then
        -- gfx.fillCircleAtPoint(lamp_a['x'], lamp_a['y'], lamp_a['radius'])
        -- toggle_lamp(lamp_1)
        -- gfx.clear()
        -- draw_lamp(lamp_1)
        -- print("lamp 1 state is " .. tostring(lamp_1['state']))
        -- lamp_2:load("images/lamp-off.png")
        -- lamp_2 = lamp_2:invertedImage()
        -- lamp_2:setInverted(true)
        -- lamp_2:draw(30, 30)
        -- playdate.graphics.image:setInverted(flag)
        toggle_lamp(lamp_2)
        draw_lamp(lamp_2)
    end
    if playdate.buttonJustPressed( playdate.kButtonRight ) then
    	lamp_10:toggle()
    	lamp_10:draw()
	end
    if playdate.buttonJustPressed( playdate.kButtonUp ) then
    end
    if playdate.buttonJustPressed( playdate.kButtonDown ) then
    end
end