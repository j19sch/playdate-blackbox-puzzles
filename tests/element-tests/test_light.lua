import '../source/elements/light'

TestLight = {}

function TestLight:testToggle()
    local light = Light:new(10, 10, false)
    luaunit.assertEquals(light.on, false)

    light:toggle()

    luaunit.assertEquals(light.on, true)

    light:toggle()

    luaunit.assertEquals(light.on, false)
end
