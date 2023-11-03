import "../source/puzzles/puzzle004"

TestPuzzle004 = {}


function TestPuzzle004:testIncreaseDuration()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.blinker.onDuration, 1000)
	luaunit.assertEquals(puzzle.blinker.offDuration, 1000)

	puzzle:increase_duration()

	luaunit.assertEquals(puzzle.blinker.onDuration, 1250)
	luaunit.assertEquals(puzzle.blinker.offDuration, 1250)
end

function TestPuzzle004:testIncreaseDurationLimit()
	local puzzle = Puzzle004:new()
	puzzle.blinker.onDuration = 7000
	puzzle.blinker.offDuration = 7000

	puzzle:increase_duration()

	luaunit.assertEquals(puzzle.blinker.onDuration, 7000)
	luaunit.assertEquals(puzzle.blinker.offDuration, 7000)
end

function TestPuzzle004:testDecreaseDuration()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.blinker.onDuration, 1000)
	luaunit.assertEquals(puzzle.blinker.offDuration, 1000)

	puzzle:decrease_duration()

	luaunit.assertEquals(puzzle.blinker.onDuration, 750)
	luaunit.assertEquals(puzzle.blinker.offDuration, 750)
end

function TestPuzzle004:testDecreaseDurationLimit()
	local puzzle = Puzzle004:new()
	puzzle.blinker.onDuration = 0
	puzzle.blinker.offDuration = 0

	puzzle:decrease_duration()

	luaunit.assertEquals(puzzle.blinker.onDuration, 0)
	luaunit.assertEquals(puzzle.blinker.offDuration, 0)
end

function TestPuzzle004:testIncreaseCycles()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.blinker.cycles, 10)

	puzzle:increase_cycles()

	luaunit.assertEquals(puzzle.blinker.cycles, 12)
end

function TestPuzzle004:testIncreaseCyclesLimit()
	local puzzle = Puzzle004:new()
	puzzle.blinker.cycles = 22

	puzzle:increase_cycles()

	luaunit.assertEquals(puzzle.blinker.cycles, 22)
end

function TestPuzzle004:testDecreaseCycles()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.blinker.cycles, 10)

	puzzle:decrease_cycles()

	luaunit.assertEquals(puzzle.blinker.cycles, 8)
end

function TestPuzzle004:testDecreaseCyclesLimit()
	local puzzle = Puzzle004:new()
	puzzle.blinker.cycles = 0

	puzzle:decrease_cycles()

	luaunit.assertEquals(puzzle.blinker.cycles, 0)
end

function TestPuzzle004:testToggleDebugDuration()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.debug_duration, false)

	puzzle:toggle_debug_duration()

	luaunit.assertEquals(puzzle.debug_duration, true)

	puzzle:toggle_debug_duration()

	luaunit.assertEquals(puzzle.debug_duration, false)
end

function TestPuzzle004:testToggleDebugCycles()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.debug_cycles, false)

	puzzle:toggle_debug_cycles()

	luaunit.assertEquals(puzzle.debug_cycles, true)

	puzzle:toggle_debug_cycles()

	luaunit.assertEquals(puzzle.debug_cycles, false)
end

function TestPuzzle004:testBlinkerOnSwitchesLightsOn()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.elements.light_1.on, false)
	luaunit.assertEquals(puzzle.elements.light_2.on, false)
	luaunit.assertEquals(puzzle.elements.light_3.on, false)
	luaunit.assertEquals(puzzle.elements.light_4.on, false)
	luaunit.assertEquals(puzzle.elements.light_5.on, false)
	luaunit.assertEquals(puzzle.blinker.counter, 10)
	puzzle.blinker.on = true

	puzzle:update_lights()

	luaunit.assertEquals(puzzle.elements.light_1.on, true)
	luaunit.assertEquals(puzzle.elements.light_2.on, true)
	luaunit.assertEquals(puzzle.elements.light_3.on, true)
	luaunit.assertEquals(puzzle.elements.light_4.on, true)
	luaunit.assertEquals(puzzle.elements.light_5.on, true)
end

function TestPuzzle004:testBlinkerOffSwitchesLightsOff()
	local puzzle = Puzzle004:new()
	puzzle.elements.light_1.on = true
	puzzle.elements.light_2.on = true
	puzzle.elements.light_3.on = true
	puzzle.elements.light_4.on = true
	puzzle.elements.light_5.on = true
	luaunit.assertEquals(puzzle.blinker.counter, 10)
	puzzle.blinker.on = false

	puzzle:update_lights()

	luaunit.assertEquals(puzzle.elements.light_1.on, false)
	luaunit.assertEquals(puzzle.elements.light_2.on, false)
	luaunit.assertEquals(puzzle.elements.light_3.on, false)
	luaunit.assertEquals(puzzle.elements.light_4.on, false)
	luaunit.assertEquals(puzzle.elements.light_5.on, false)
end

function TestPuzzle004:testOffLightAboveIndexStaysOff()
	local puzzle = Puzzle004:new()
	luaunit.assertEquals(puzzle.elements.light_5.on, false)
	puzzle.blinker.on = true
	puzzle.blinker.counter = 8

	puzzle:update_lights()

	luaunit.assertEquals(puzzle.elements.light_5.on, false)
end

function TestPuzzle004:testOnLightAboveIndexTurnsOff()
	local puzzle = Puzzle004:new()
	puzzle.elements.light_5.on = true
	puzzle.blinker.counter = 8

	puzzle:update_lights()

	luaunit.assertEquals(puzzle.elements.light_5.on, false)
end
