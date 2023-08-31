local gfx <const> = playdate.graphics

function define_lamp(state, x, y, radius)
    local lamp = {}
    lamp['state'] = state
    lamp['x'] = x
    lamp['y'] = y
    lamp['radius'] = radius

    return lamp
end

function draw_lamp(lamp)
    if lamp['state'] == true then
        -- print("drawing full circle")
        gfx.fillCircleAtPoint(lamp['x'], lamp['y'], lamp['radius'])
    else
        -- print("drawing empty circle")
        gfx.drawCircleAtPoint(lamp['x'], lamp['y'], lamp['radius'])
    end
end


function toggle_lamp(lamp)
    if lamp['state'] == true then
        lamp['state'] = false
    else
        lamp['state'] = true
    end
end
