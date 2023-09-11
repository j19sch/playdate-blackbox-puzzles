import "../source/puzzle001"

TestPuzzle001 = {}
	function TestPuzzle001:testPuzzle001Init()
		local puzzle001 = Puzzle001:new()
		puzzle001:init()
		luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)
	end
