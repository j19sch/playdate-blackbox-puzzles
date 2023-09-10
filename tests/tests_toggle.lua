import "../source/toggle"

-- local gfx <const> = playdate.graphics

function notestToggleOrientation()
    toggle = Toggle:new(10, 10, "up")
    luaunit.assertEquals(toggle.orientation, "up")
end

function notestToggleOrientationFail()
    toggle = Toggle:new(10, 10, "up")
    luaunit.assertEquals(toggle.orientation, "down")
end


-- function testToggleImage()
	-- toggle = Toggle:new(10, 10, "up")
	-- luaunit.assertEquals(toggle.image, gfx.image.new("images/toggle-up.png"))
	-- luaunit.assertEquals(toggle.image, gfx.image.new("images/toggle-down.png"))
	-- luaunit.assertEquals(toggle.x_pos, 99)
	-- -- tests_toggle.lua:15: expected: 99, actual: nil
-- end
