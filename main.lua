import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "button"
import "toggle"

local gfx <const> = playdate.graphics

-- screen: 400 x 240

function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	gfx.drawText("Playdate Black Box Puzzles", 5, 5)

	button_top = Button:new(80, 40, false)
	button_top:draw()

	button_left = Button:new(15, 72, false)
	button_left:draw()

	button_bottom = Button:new(80, 105, false)
	button_bottom:draw()

	button_right = Button:new(145, 72, false)
	button_right:draw()

	toggle = Toggle:new(300, 72)
	toggle:draw()

end

myGameSetUp()


function playdate.update()
	
	if toggle.flipped == true then
	    if playdate.buttonJustPressed( playdate.kButtonUp ) then
    		button_top:toggle_and_draw()
    	end
    	if playdate.buttonJustPressed( playdate.kButtonDown ) then
    		button_bottom:toggle_and_draw()
    	end
	else
	    if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		   	button_left:toggle_and_draw()
    	end
    	if playdate.buttonJustPressed( playdate.kButtonRight ) then
	   		button_right:toggle_and_draw()
		end
	end


    if playdate.buttonJustPressed( playdate.kButtonA) then
    	toggle:flip_and_draw()
	end
end