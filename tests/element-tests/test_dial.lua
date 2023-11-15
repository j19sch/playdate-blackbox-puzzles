import "../source/elements/dial"

TestDial = {}


function TestDial:testRotateWhenEnabled()
	local dial = Dial:new(0, 0, 0, "square", true)
	dial:rotate(90)
    luaunit.assertEquals(dial.angle, 90)

    dial:rotate(-45)
    luaunit.assertEquals(dial.angle, 45)
end

function TestDial:testRotateWhenDisabled()
	local dial = Dial:new(0, 0, 0, "square", false)
	dial:rotate(90)
    luaunit.assertEquals(dial.angle, 0)

    dial:rotate(-45)
    luaunit.assertEquals(dial.angle, 0)
end

function TestDial:testRotateOver360()
	local dial = Dial:new(0, 0, 330, "square", true)
	dial:rotate(50)
    luaunit.assertEquals(dial.angle, 20)

    dial:rotate(-45)
    luaunit.assertEquals(dial.angle, 335)
end
