import "../source/elements/toggle"

TestToggle = {}

function TestToggle:testFlip()
	local toggle = Toggle:new(10, 10, "down")
	luaunit.assertEquals(toggle.orientation, "down")
	luaunit.assertEquals(toggle.flipped, false)

	toggle:flip()

	luaunit.assertEquals(toggle.orientation, "up")
	luaunit.assertEquals(toggle.flipped, true)

	toggle:flip()

	luaunit.assertEquals(toggle.orientation, "down")
	luaunit.assertEquals(toggle.flipped, false)
end
