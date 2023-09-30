-- todo: clean up CoreLibs imports
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "menu"

import "puzzles/puzzle001"
import "puzzles/puzzle001a"
import "puzzles/puzzle001b"
import "puzzles/puzzle001c"
import "puzzles/puzzle001d"
import "puzzles/puzzle002"
import "puzzles/puzzle003"

local gfx <const> = playdate.graphics

-- screen: 400 x 240


function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	local menu = playdate.getSystemMenu()

	local _, _ = menu:addMenuItem("pick puzzle", function()
		game_state = "menu"
		puzzle_loaded = false
	end)

	local _, _ = menu:addMenuItem("puzzle001s", function()
		game_state = "puzzles001_menu"
		puzzle_loaded = false
	end)

	local _, _ = menu:addMenuItem("about", function()
		game_state = "about"
		puzzle_loaded = false
	end)

	game_state = "title"
	-- game_state = "puzzle002" -- quickload puzzle for dev purposes

	puzzle_loaded = false

	puzzle_menu_active_index = 1 -- for game_state "menu"
	puzzles001_menu_active_index = 1 -- for game_state "puzzles001_menu"

end


myGameSetUp()


-- ToDo: add function to change game state, clear screen and pop input handlers


function playdate.update()
	-- to consider: re-use puzzle variable to load different puzzle

	-- ToDo: nil puzzle after exiting a puzzle

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
		playdate.inputHandlers.pop()  -- because puzzle001b uses inputHandlers
		puzzle_menu()

	elseif game_state == "puzzles001_menu" then
		playdate.graphics.clear()
		playdate.inputHandlers.pop()  -- because puzzle001b uses inputHandlers
		puzzles001_menu()

	elseif game_state == "about" then
		playdate.graphics.clear()
		playdate.inputHandlers.pop()  -- because puzzle001b uses inputHandlers
		about()

	elseif game_state == "puzzle001" then
		gfx.drawText("Playdate BlackBox Puzzle 001", 5, 5)
		if puzzle_loaded == false then
			puzzle = Puzzle001:new()
			puzzle:draw()
			puzzle_loaded = true
		else
			puzzle:runWrapper()
		end

	elseif game_state == "puzzle001a" then
		gfx.drawText("Playdate BlackBox Puzzle 001a", 5, 5)
		if puzzle_loaded == false then
			puzzle = Puzzle001a:new()
			puzzle:draw()
			puzzle_loaded = true
		else
		    puzzle:run()
		    puzzle:draw()
		end

	elseif game_state == "puzzle001b" then
		gfx.drawText("Playdate BlackBox Puzzle 001b", 5, 5)
		if puzzle_loaded == false then
			puzzle = Puzzle001b:new()
			puzzle:addInputHandlers()
			puzzle:draw()
			puzzle_loaded = true
		else
		    puzzle:draw()
		end

	elseif game_state == "puzzle001c" then
		gfx.drawText("Playdate BlackBox Puzzle 001c", 5, 5)
		gfx.drawText("not implemented yet", 5, 50)

	elseif game_state == "puzzle001d" then
		gfx.drawText("Playdate BlackBox Puzzle 001d", 5, 5)
		if puzzle_loaded == false then
			puzzle = Puzzle001d:new()
			puzzle:draw()
			puzzle_loaded = true
		else
			puzzle:run()
		end

	elseif game_state == "puzzle001e" then
		gfx.drawText("Playdate BlackBox Puzzle 001e", 5, 5)
		gfx.drawText("not implemented yet", 5, 50)

	elseif game_state == "puzzle002" then
		playdate.graphics.clear()
		gfx.drawText("Playdate BlackBox Puzzle 002", 5, 5)

		local crank_pos = playdate.getCrankPosition()
		if puzzle_loaded == false then
			puzzle = Puzzle002:new(crank_pos) -- luacheck: no unused
			puzzle_loaded = true
		else
			-- ToDo: deal with button press and crank position in run() method
			if playdate.buttonJustPressed( playdate.kButtonA ) then
				puzzle:logic(playdate.kButtonA)
			end
			puzzle:draw(crank_pos)
		end

	elseif game_state == "puzzle003" then
		gfx.drawText("Playdate BlackBox Puzzle 003", 5, 5)
		-- ToDo: screen title flickers when running puzzle
		-- probably because of the playdate.graphics.clear() on if crank changed
		-- gfx.drawText('xyz', 15, 35) in draw() does not do tihs
		if puzzle_loaded == false then
			puzzle = Puzzle003:new()
			puzzle:draw()
			puzzle_loaded = true
		else
			puzzle:run()
		end
	end
end
