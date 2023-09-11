import "../source/toggle"

TestToggle = {}

function TestToggle:testToggleOrientationUp()
    local toggle = Toggle:new(10, 10, "up")
    luaunit.assertEquals(toggle.orientation, "up")
end

function TestToggle:testToggleOrientationDown()
    local toggle = Toggle:new(10, 10, "down")
    luaunit.assertEquals(toggle.orientation, "down")
end

function TestToggle:testToggleFlip()
	local toggle = Toggle:new(10, 10, "down")
	luaunit.assertEquals(toggle.orientation, "down")
	luaunit.assertEquals(toggle.flipped, false)
	toggle:flip()
	luaunit.assertEquals(toggle.orientation, "up")
	luaunit.assertEquals(toggle.flipped, true)
end
