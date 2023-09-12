-- todo: clean up CoreLibs imports
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "puzzle001"
import "puzzle001a"
import "puzzle001b"
import "puzzle001c"

local gfx <const> = playdate.graphics

-- screen: 400 x 240


function myGameSetUp()
	gfx.setBackgroundColor(gfx.kColorWhite)

	gfx.drawText("Playdate BlackBox Puzzles", 5, 5)

	puzzle001 = Puzzle001b:new()
	puzzle001:init()
	puzzle001:draw()

end

myGameSetUp()


function playdate.update()

    -- if playdate.buttonJustPressed( playdate.kButtonUp ) then
	-- 	puzzle001:run( playdate.kButtonUp )
	-- end
	-- if playdate.buttonJustPressed( playdate.kButtonDown ) then
	-- 	puzzle001:run( playdate.kButtonDown )
	-- end
    -- if playdate.buttonJustPressed( playdate.kButtonLeft ) then
	--    	puzzle001:run( playdate.kButtonLeft )
	-- end
	-- if playdate.buttonJustPressed( playdate.kButtonRight ) then
   	-- 	puzzle001:run( playdate.kButtonRight )
	-- end
    -- if playdate.buttonJustPressed( playdate.kButtonA ) then
    -- 	puzzle001:run( playdate.kButtonA )
	-- end
    -- if playdate.buttonJustPressed( playdate.kButtonB ) then
    -- 	puzzle001:run( playdate.kButtonB )
	-- end

end
