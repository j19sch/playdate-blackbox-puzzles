import "../source/puzzles/puzzle001"

TestPuzzle001 = {}

function TestPuzzle001:flipToggleOn()
	local puzzle001 = Puzzle001:new()
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
	puzzle001:logic(playdate.kButtonA)
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
end

function TestPuzzle001:flipToggleOff()
	local puzzle001 = Puzzle001:new()
	puzzle001.elements.toggle_vert.flipped = true
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, true)
	puzzle001:logic(playdate.kButtonA)
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
end


function TestPuzzle001:toggleIsOff()
	local puzzle001 = Puzzle001:new()
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

function TestPuzzle001:toggleIsOn()
	local puzzle001 = Puzzle001:new()
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
