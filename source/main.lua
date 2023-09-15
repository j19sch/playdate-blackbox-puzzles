-- todo: clean up CoreLibs imports
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "puzzle001"
import "puzzle001a"
import "puzzle001b"
import "puzzle001c"

local gfx <const> = playdate.graphics

-- screen: 400 x 240


function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	-- gfx.drawText("Playdate BlackBox Puzzles", 5, 5)

	game_state = "title"
	puzzle_loaded = false

	local menu = playdate.getSystemMenu()

	local menuItem, error = menu:addMenuItem("to menu", function()
    	print("menu: going back to the menu")
		game_state = "menu"
		puzzle_loaded = false
	end)
	
end

myGameSetUp()


function playdate.update()

	if game_state == "title" then
		local title_screen = gfx.image.new("assets/images/title-screen.png")
		title_screen:draw(0, 0)
		gfx.drawText("Press A to pick a puzzle", 100, 150)

	    if playdate.buttonJustPressed( playdate.kButtonA ) then
	    	game_state = "menu"
	    	playdate.graphics.clear() -- best place to do this?
		end

	elseif game_state == "menu" then
		playdate.graphics.clear()
		gfx.drawText("Playdate BlackBox Puzzles", 5, 5)
		gfx.drawText("Press A to start Puzzle 001", 100, 100)
	    if playdate.buttonJustPressed( playdate.kButtonA ) then
	    	game_state = "puzzle001"
	    	playdate.graphics.clear() -- best place to do this?
		end

	elseif game_state == "puzzle001" then
		gfx.drawText("Playdate BlackBox Puzzle 001", 5, 5)
		if puzzle_loaded == false then
			puzzle001 = Puzzle001a:new()
			puzzle001:init()
			puzzle001:draw()
			puzzle_loaded = true
		else
		    if playdate.buttonJustPressed( playdate.kButtonUp ) then
				puzzle001:run( playdate.kButtonUp )
			end
			if playdate.buttonJustPressed( playdate.kButtonDown ) then
				puzzle001:run( playdate.kButtonDown )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		   		puzzle001:run( playdate.kButtonLeft )
			end
			if playdate.buttonJustPressed( playdate.kButtonRight ) then
	   			puzzle001:run( playdate.kButtonRight )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonA ) then
	    		puzzle001:run( playdate.kButtonA )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonB ) then
	    		puzzle001:run( playdate.kButtonB )
			end
		end
	end

end
