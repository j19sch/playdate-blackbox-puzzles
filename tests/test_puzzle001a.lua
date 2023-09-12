import "../source/puzzle001a"

TestPuzzle001a = {}
	function TestPuzzle001a:testPuzzle1aFlipToggleOn()
		local puzzle001 = Puzzle001a:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
		puzzle001:logic(playdate.kButtonA)
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
	end

	function TestPuzzle001a:testPuzzle1aFlipToggleOff()
		local puzzle001 = Puzzle001a:new()
		puzzle001:init()
		puzzle001.elements.toggle_vert.flipped = true
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
		puzzle001:logic(playdate.kButtonA)
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
	end


	function TestPuzzle001a:testPuzzle1aToggleIsOff()
		local puzzle001 = Puzzle001a:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

		puzzle001:logic(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)

		puzzle001:logic(playdate.kButtonRight)
		luaunit.assertEquals(puzzle001.elements.button_right.pressed, true)

		puzzle001:logic(playdate.kButtonUp)
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)

		puzzle001:logic(playdate.kButtonDown)
		luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, false)
		
	end

	function TestPuzzle001a:testPuzzle1aToggleIsOn()
		local puzzle001 = Puzzle001a:new()
		puzzle001:init()
		puzzle001.elements.toggle_vert.flipped = true
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)

		puzzle001:logic(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, false)

		puzzle001:logic(playdate.kButtonRight)
		luaunit.assertEquals(puzzle001.elements.button_right.pressed, false)

		puzzle001:logic(playdate.kButtonUp)
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, true)

		puzzle001:logic(playdate.kButtonDown)
		luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, true)
	end
