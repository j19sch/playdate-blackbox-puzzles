import "../source/puzzle001"

TestPuzzle001 = {}
	function TestPuzzle001:testPuzzle001Init()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)
	end

	function TestPuzzle001:testPuzzle1Run2()
		-- this test does draw on the simulator screen; cheap fix: clear screen after end of tests
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, false)
		puzzle001:run2(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)
	end

	function TestPuzzle001:tearDown()
		-- after every test, because tests may draw on screen
		playdate.graphics.clear(playdate.graphics.kColorWhite)
    end
