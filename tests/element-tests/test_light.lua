import '../source/elements/light'

TestLight = {}

function TestLight:testLightOff()
    local light = Light:new(10, 10, false, 0)
    luaunit.assertEquals(light.on, false, 0)
end

function TestLight:testLightOn()
    local light = Light:new(10, 10, true)
    luaunit.assertEquals(light.on, true)
end

function TestLight:testLightToggle()
    local light = Light:new(10, 10, false)
    luaunit.assertEquals(light.on, false)
    light:toggle()
    luaunit.assertEquals(light.on, true)
end
