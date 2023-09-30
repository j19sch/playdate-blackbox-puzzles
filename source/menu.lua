local gfx <const> = playdate.graphics

function puzzle_menu()
	gfx.drawText("Playdate BlackBox Puzzles", 5, 5)

	local menu = {
		"puzzle001",
		"puzzle002",
		"puzzle003",
	}

	local start_x = 15
	local start_y = 50

	for index, val in ipairs(menu) do
		if index == puzzle_menu_active_index then
  			gfx.drawText('x', start_x, start_y)
			end
			gfx.drawText(val, start_x + 15, start_y)
			start_y += 25  -- ToDo: will fall outside of screen with more puzzles
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
end


function puzzles001_menu()
	gfx.drawText("Different implementations of puzzle001 ", 5, 5)
	-- To consider: change this to an option in the menu,
	-- so the menu can have a return to title.
	-- Or return to title instead of return to menu.
	
	local menu = {
		"puzzle001",
		"puzzle001a",
		"puzzle001b",
		"puzzle001c",
		"puzzle001d",
	}

	local start_x = 15
	local start_y = 50

	for index, val in ipairs(menu) do
		if index == puzzles001_menu_active_index then
  			gfx.drawText('x', start_x, start_y)
			end
			gfx.drawText(val, start_x + 15, start_y)
			start_y += 25  -- ToDo: will fall outside of screen with more puzzles
	end

    if playdate.buttonJustPressed( playdate.kButtonUp ) then
		puzzles001_menu_active_index -= 1
		if puzzles001_menu_active_index <= 0 then
			puzzles001_menu_active_index = #menu
		end
	end
	if playdate.buttonJustPressed( playdate.kButtonDown ) then
		puzzles001_menu_active_index += 1
		if puzzles001_menu_active_index > #menu then
			puzzles001_menu_active_index = 1
		end
	end
	if playdate.buttonJustPressed( playdate.kButtonA ) then
		game_state = menu[puzzles001_menu_active_index]
		playdate.graphics.clear()
	end
end


function about()
	gfx.drawText("About", 5, 5)
	gfx.drawText("The goal of these puzzles is for you", 10, 45)
	gfx.drawText("to discover what they do.", 10, 60)
	gfx.drawText("Inspired by workroomprds' Black Box Puzzles:", 10, 100)
	gfx.drawText("http://blackboxpuzzles.workroomprds.com/", 10, 115)
	gfx.drawText("made by @joeposaurus@chaos.social", 10, 160)
end
