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

	puzzle_menu_active_index = 1
	
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

		-- gfx.drawText("Press A to start Puzzle 001", 100, 100)
	    -- if playdate.buttonJustPressed( playdate.kButtonA ) then
	    -- 	game_state = "puzzle001"
	    -- 	playdate.graphics.clear() -- best place to do this?
		-- end

		-- local menu = { 'puzzle001', 'puzzle001a', 'puzzle001b', 'puzzle001c'}

		local menu = {
			"puzzle001",
			"puzzle001a",
			"puzzle001b",
			"puzzle001c",
		}

		local start_x = 15
		local start_y = 50

		for index, val in ipairs(menu) do
			if index == puzzle_menu_active_index then
	  			gfx.drawText('x', start_x, start_y)
  			end
  			gfx.drawText(val, start_x + 15, start_y)
  			start_y += 25
		end

	    if playdate.buttonJustPressed( playdate.kButtonUp ) then
			puzzle_menu_active_index -= 1
			if puzzle_menu_active_index <= 0 then
				puzzle_menu_active_index = #menu
			end
		end
		if playdate.buttonJustPressed( playdate.kButtonDown ) then
			puzzle_menu_active_index += 1
			if puzzle_menu_active_index > #menu then
				puzzle_menu_active_index = 1
			end
		end
    	if playdate.buttonJustPressed( playdate.kButtonA ) then
    		game_state = menu[puzzle_menu_active_index]
			playdate.graphics.clear()
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
