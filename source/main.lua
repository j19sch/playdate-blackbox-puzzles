-- todo: clean up CoreLibs imports
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "menu"

import "puzzle001"
import "puzzle001a"
import "puzzle001b"
import "puzzle001c"
import "puzzle002"

local gfx <const> = playdate.graphics

-- screen: 400 x 240


function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	local menu = playdate.getSystemMenu()

	local menuItem, error = menu:addMenuItem("pick puzzle", function()
    	print("menu: going back to the menu")
		game_state = "menu"
		puzzle_loaded = false
	end)

	game_state = "title"
	-- game_state = "puzzle002" -- quickload puzzle
	
	puzzle_loaded = false

	puzzle_menu_active_index = 1 -- for game_state "menu"
	
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
		playdate.inputHandlers.pop()
		gfx.drawText("Playdate BlackBox Puzzles", 5, 5)
		puzzle_menu()

	elseif game_state == "puzzle001" then
		gfx.drawText("Playdate BlackBox Puzzle 001", 5, 5)
		if puzzle_loaded == false then
			puzzle001 = Puzzle001:new()
			puzzle001:init()
			puzzle001:draw()
			puzzle_loaded = true
		else
		    puzzle001:run()
		    puzzle001:draw()
		end

	elseif game_state == "puzzle001a" then
		gfx.drawText("Playdate BlackBox Puzzle 001a", 5, 5)
		if puzzle_loaded == false then
			puzzle001a = Puzzle001a:new()
			puzzle001a:init()
			puzzle001a:draw()
			puzzle_loaded = true
		else
		    if playdate.buttonJustPressed( playdate.kButtonUp ) then
				puzzle001a:run( playdate.kButtonUp )
			end
			if playdate.buttonJustPressed( playdate.kButtonDown ) then
				puzzle001a:run( playdate.kButtonDown )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonLeft ) then
		   		puzzle001a:run( playdate.kButtonLeft )
			end
			if playdate.buttonJustPressed( playdate.kButtonRight ) then
	   			puzzle001a:run( playdate.kButtonRight )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonA ) then
	    		puzzle001a:run( playdate.kButtonA )
			end
	    	if playdate.buttonJustPressed( playdate.kButtonB ) then
	    		puzzle001a:run( playdate.kButtonB )
			end
		end
	
	elseif game_state == "puzzle001b" then
		-- bug: need to clear input handler after exiting puzzle
		gfx.drawText("Playdate BlackBox Puzzle 001b", 5, 5)
		if puzzle_loaded == false then
			puzzle001b = Puzzle001b:new()
			puzzle001b:init()
			puzzle001b:draw()
			puzzle_loaded = true
		else
		    puzzle001b:draw()
		end
	
	elseif game_state == "puzzle001c" then
		gfx.drawText("Playdate BlackBox Puzzle 001c", 5, 5)
		gfx.drawText("not implemented yet", 5, 50)

	elseif game_state == "puzzle002" then
		playdate.graphics.clear()
		gfx.drawText("Playdate BlackBox Puzzle 002", 5, 5)

		local crank_pos = playdate.getCrankPosition()
		if puzzle_loaded == false then
			puzzle002 = Puzzle002:new()
			puzzle002:init(crank_pos)  -- ToDo: combine new() and init()
			puzzle_loaded = true
		else
			if playdate.buttonJustPressed( playdate.kButtonA ) then
				puzzle002:logic(playdate.kButtonA)
			end
			puzzle002:draw(crank_pos)
		end
	end
end
