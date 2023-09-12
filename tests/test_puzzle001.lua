import "../source/puzzle001"

TestPuzzle001 = {}
	function TestPuzzle001:testPuzzle1aFlipToggleOn()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
		puzzle001:run2(playdate.kButtonA)
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
	end

	function TestPuzzle001:testPuzzle1aFlipToggleOff()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		puzzle001.elements.toggle_vert.flipped = true
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
		puzzle001:run2(playdate.kButtonA)
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
	end

	function TestPuzzle001:testPuzzle1aToggleIsOff()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

		puzzle001:run2(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)

		puzzle001:run2(playdate.kButtonRight)
		luaunit.assertEquals(puzzle001.elements.button_right.pressed, true)

		puzzle001:run2(playdate.kButtonUp)
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)

		puzzle001:run2(playdate.kButtonDown)
		luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, false)
		
	end

	function TestPuzzle001:testPuzzle1aToggleIsOn()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		puzzle001.elements.toggle_vert.flipped = true
		luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)

		puzzle001:run2(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, false)

		puzzle001:run2(playdate.kButtonRight)
		luaunit.assertEquals(puzzle001.elements.button_right.pressed, false)

		puzzle001:run2(playdate.kButtonUp)
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, true)

		puzzle001:run2(playdate.kButtonDown)
		luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, true)
	end

	function TestPuzzle001:tearDown()
		-- after every test, because tests draw on the screen
		playdate.graphics.clear(playdate.graphics.kColorWhite)
    end
