import "../source/puzzles/puzzle005"

TestPuzzle005 = {}


function TestPuzzle005:testDisableEnableLeftDial()
	local puzzle = Puzzle005:new()
	luaunit.assertEquals(puzzle.elements.dial_left.enabled, true)
	luaunit.assertEquals(puzzle.elements.button_left.pressed, true)

	puzzle:toggle_left_dial()
	luaunit.assertEquals(puzzle.elements.dial_left.enabled, false)
	luaunit.assertEquals(puzzle.elements.button_left.pressed, false)

	puzzle:toggle_left_dial()
	luaunit.assertEquals(puzzle.elements.dial_left.enabled, true)
	luaunit.assertEquals(puzzle.elements.button_left.pressed, true)
end

function TestPuzzle005:testEnableDisableRightDial()
	local puzzle = Puzzle005:new()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, false)
	luaunit.assertEquals(puzzle.elements.button_right.pressed, false)

	puzzle:toggle_right_dial()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, true)
	luaunit.assertEquals(puzzle.elements.button_right.pressed, true)

	puzzle:toggle_right_dial()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, false)
	luaunit.assertEquals(puzzle.elements.button_right.pressed, false)
end

function TestPuzzle005:testLightOne()
	local puzzle = Puzzle005:new()
	luaunit.assertEquals(puzzle.elements.dial_left.enabled, true)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 180)
	luaunit.assertEquals(puzzle.elements.light_1.on, true)

	puzzle.elements.dial_left:rotate(-10)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 170)
	luaunit.assertEquals(puzzle.elements.light_1.on, true)

	puzzle.elements.dial_left:rotate(-1)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 169)
	luaunit.assertEquals(puzzle.elements.light_1.on, false)

	puzzle.elements.dial_left:rotate(21)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 190)
	luaunit.assertEquals(puzzle.elements.light_1.on, true)

	puzzle.elements.dial_left:rotate(1)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 191)
	luaunit.assertEquals(puzzle.elements.light_1.on, false)
end

function TestPuzzle005:testLightTWo()
	local puzzle = Puzzle005:new()
	luaunit.assertEquals(puzzle.elements.dial_left.enabled, true)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 180)
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, false)
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 0)
	luaunit.assertEquals(puzzle.elements.light_2.on, false)

	puzzle:toggle_right_dial()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, true)

	puzzle.elements.dial_left:rotate(150)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 330)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.light_2.on, true)

	puzzle.elements.dial_left:rotate(-1)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 329)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.light_2.on, false)

	puzzle.elements.dial_left:rotate(61)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 30)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.light_2.on, true)

	puzzle.elements.dial_left:rotate(1)
	luaunit.assertEquals(puzzle.elements.dial_left.angle, 31)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.light_2.on, false)
end

function TestPuzzle005:testLightThree()
	local puzzle = Puzzle005:new()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, false)
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 0)
	luaunit.assertEquals(puzzle.elements.light_3.on, false)
	puzzle:toggle_right_dial()
	luaunit.assertEquals(puzzle.elements.dial_right.enabled, true)

	puzzle.elements.dial_right:rotate(30)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 30)
	luaunit.assertEquals(puzzle.elements.light_3.on, true)

	puzzle.elements.dial_right:rotate(-1)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 29)
	luaunit.assertEquals(puzzle.elements.light_3.on, false)

	puzzle.elements.dial_right:rotate(31)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 60)
	luaunit.assertEquals(puzzle.elements.light_3.on, true)

	puzzle.elements.dial_right:rotate(1)
	puzzle:logic()
	luaunit.assertEquals(puzzle.elements.dial_right.angle, 61)
	luaunit.assertEquals(puzzle.elements.light_3.on, false)
end
