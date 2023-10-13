import "../source/puzzles/puzzle003"

TestPuzzle003 = {}


function TestPuzzle003:testPuzzle3UndockCrank()
	local puzzle003 = Puzzle003:new()
	luaunit.assertEquals(puzzle003.elements.toggle.flipped, false)
	puzzle003:logic(false, 0)
	luaunit.assertEquals(puzzle003.elements.toggle.flipped, true)
end

function TestPuzzle003:testPuzzle3DockCrank()
	local puzzle003 = Puzzle003:new()
	puzzle003.elements.toggle.flipped = true
	puzzle003:logic(true, 0)
	luaunit.assertEquals(puzzle003.elements.toggle.flipped, false)
	luaunit.assertEquals(puzzle003.elements.circle.r, 10)
end

function TestPuzzle003:testPuzzle3RotateCrankPos()
	local puzzle003 = Puzzle003:new()
	puzzle003.elements.toggle.flipped = true
	local crank_diff = 20
	puzzle003:logic(false, crank_diff)
	luaunit.assertEquals(puzzle003.elements.circle.r, crank_diff)
	luaunit.assertEquals(puzzle003.elements.circle.fill, true)
end


function TestPuzzle003:testPuzzle3RotateCrankPos()
	local puzzle003 = Puzzle003:new()
	puzzle003.elements.toggle.flipped = true
	local crank_diff = -20
	puzzle003:logic(false, crank_diff)
	luaunit.assertEquals(puzzle003.elements.circle.r, math.abs(crank_diff))
	luaunit.assertEquals(puzzle003.elements.circle.fill, false)
end

