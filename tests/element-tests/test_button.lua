import '../source/elements/button'

TestButton = {}

function TestButton:testToggle()
    local button = Button:new(10, 10, false)
    luaunit.assertEquals(button.pressed, false)

    button:toggle()

    luaunit.assertEquals(button.pressed, true)

    button:toggle()

    luaunit.assertEquals(button.pressed, false)
end
