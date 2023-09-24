import "../source/puzzle001"

TestPuzzle001 = {}

	-- ToDo: figure out how to implement tests considering run()

	function TestPuzzle001:emptyTest()
		luaunit.assertEquals(true, true)
	end

	function TestPuzzle001:tearDown()
		-- after every test, because tests draw on the screen
		playdate.graphics.clear(playdate.graphics.kColorWhite)
    end
