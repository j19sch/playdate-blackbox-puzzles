import "../source/puzzle001a"

TestPuzzle001a = {}
	function TestPuzzle001a:testPuzzle1aLogic()
		local puzzle001 = Puzzle001a:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, false)
		puzzle001:logic(playdate.kButtonLeft)
		luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)
	end
