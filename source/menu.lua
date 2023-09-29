local gfx <const> = playdate.graphics

function puzzle_menu()
	local menu = {
		"puzzle001",
		"puzzle001a",
		"puzzle001b",
		"puzzle001c",
		"puzzle001d",
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