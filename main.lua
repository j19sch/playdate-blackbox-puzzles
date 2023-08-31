import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "lamp"

local gfx <const> = playdate.graphics

-- screen: 400 x 240

function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	-- needs to be permanent
	gfx.drawText("Playdate Black Box Puzzles", 5, 5)

	lamp_1 = define_lamp(false, 100, 100, 40)
	draw_lamp(lamp_1)

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
        toggle_lamp(lamp_1)
        gfx.clear()
        draw_lamp(lamp_1)
        print("lamp 1 state is " .. tostring(lamp_1['state']))
    end
    if playdate.buttonJustPressed( playdate.kButtonUp ) then
    end
    if playdate.buttonJustPressed( playdate.kButtonDown ) then
    end
end