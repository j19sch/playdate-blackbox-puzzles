import "../source/toggle"


function testToggleOrientationUp()
    local toggle = Toggle:new(10, 10, "up")
    luaunit.assertEquals(toggle.orientation, "up")
end

function testToggleOrientationDown()
    local toggle = Toggle:new(10, 10, "down")
    luaunit.assertEquals(toggle.orientation, "down")
end

function testToggleFlip()
	local toggle = Toggle:new(10, 10, "down")
	luaunit.assertEquals(toggle.orientation, "down")
	luaunit.assertEquals(toggle.flipped, false)
	toggle:flip()
	luaunit.assertEquals(toggle.orientation, "up")
	luaunit.assertEquals(toggle.flipped, true)
end
