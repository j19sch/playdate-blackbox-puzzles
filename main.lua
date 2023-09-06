-- todo: clean up CoreLibs imports
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "puzzle001"

local gfx <const> = playdate.graphics

-- screen: 400 x 240

function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	gfx.drawText("Playdate Black Box Puzzles", 5, 5)

	puzzle001 = Puzzle001:new()
	puzzle001:init()
	puzzle001:draw()

end

myGameSetUp()


function playdate.update()

	puzzle001:run()

end
