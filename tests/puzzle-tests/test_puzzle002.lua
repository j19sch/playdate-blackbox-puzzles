import "../source/puzzles/puzzle002"

TestPuzzle002 = {}

function TestPuzzle002:testPuzzle2Toggle()
	local crank_pos = 0
	local puzzle = Puzzle002:new(crank_pos)

	luaunit.assertEquals(puzzle.elements.circle.fill, true)
	luaunit.assertEquals(puzzle.elements.toggle.flipped, false)

	puzzle:logic(playdate.kButtonA)
	luaunit.assertEquals(puzzle.elements.toggle.flipped, true)
	luaunit.assertEquals(puzzle.elements.circle.fill, false)

	puzzle:logic(playdate.kButtonA)
	luaunit.assertEquals(puzzle.elements.toggle.flipped, false)
	luaunit.assertEquals(puzzle.elements.circle.fill, true)
end
