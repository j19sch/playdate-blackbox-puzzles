import '../source/button'

function testButtonFalse()
    local button = Button:new(10, 10, false)
    luaunit.assertEquals(button.pressed, false)
end

function testButtonTrue()
    local button = Button:new(10, 10, true)
    luaunit.assertEquals(button.pressed, true)
end

function testButtonToggle()
    local button = Button:new(10, 10, false)
    luaunit.assertEquals(button.pressed, false)
    button:toggle()
    luaunit.assertEquals(button.pressed, true)
end
