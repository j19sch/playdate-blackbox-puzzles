import "../source/puzzles/puzzle001d"

TestPuzzle001d = {}

	-- ToDo: figure out how to implement tests considering run()

function TestPuzzle001d:testStartSate()
	local puzzle001 = Puzzle001d:new()
	luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)
	luaunit.assertEquals(puzzle001.elements.button_left.pressed, false)
	luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, false)
	luaunit.assertEquals(puzzle001.elements.button_right.pressed, false)
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)
	luaunit.assertEquals(puzzle001.elements.toggle_hor.flipped, false)
end

function TestPuzzle001d:testButtonTop()
	local puzzle001 = Puzzle001d:new()
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

	puzzle001:toggle_button_top()
	luaunit.assertEquals(puzzle001.elements.button_top.pressed, false)

	puzzle001.elements.toggle_vert.flipped = true
	puzzle001:toggle_button_top()
	luaunit.assertEquals(puzzle001.elements.button_top.pressed, true)
end

function TestPuzzle001d:testButtonLeft()
	local puzzle001 = Puzzle001d:new()
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

	puzzle001:toggle_button_left()
	luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)

	puzzle001.elements.toggle_vert.flipped = true
	puzzle001:toggle_button_left()
	luaunit.assertEquals(puzzle001.elements.button_left.pressed, true)
end

function TestPuzzle001d:testButtonBottom()
	local puzzle001 = Puzzle001d:new()
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

	puzzle001:toggle_button_bottom()
	luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, false)

	puzzle001.elements.toggle_vert.flipped = true
	puzzle001:toggle_button_bottom()
	luaunit.assertEquals(puzzle001.elements.button_bottom.pressed, true)
end

function TestPuzzle001d:testButtonRight()
	local puzzle001 = Puzzle001d:new()
	luaunit.assertEquals(puzzle001.elements.toggle_vert.flipped, false)

	puzzle001:toggle_button_right()
	luaunit.assertEquals(puzzle001.elements.button_right.pressed, true)

	puzzle001.elements.toggle_vert.flipped = true
	puzzle001:toggle_button_right()
	luaunit.assertEquals(puzzle001.elements.button_right.pressed, true)
end
