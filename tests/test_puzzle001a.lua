import "../source/puzzle001a"

TestPuzzle001a = {}

-- ToDo: figure out how to implement tests considering run()

function TestPuzzle001a:testEmptyTest()
	luaunit.assertEquals(true, true)
end

function TestPuzzle001a:tearDown()
	-- after every test, because tests draw on the screen
	playdate.graphics.clear(playdate.graphics.kColorWhite)
end
