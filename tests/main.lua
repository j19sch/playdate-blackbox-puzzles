import 'luaunit/playdate_luaunit_fix'
import 'luaunit/luaunit'

import 'test_button'
import 'test_toggle'


-- turns off updating
playdate.stop()

-- when outputting a table, include a table address
luaunit.PRINT_TABLE_REF_IN_ERROR_MSG = true

-- process the command line args (if any)
local testOutputFilename = "test_output"
local outputType = "text"
local luaunit_args = {'--output', 'text', '--verbose', '-r'}

-- run the tests
local returnValue = luaunit.LuaUnit.run(table.unpack(luaunit_args))

print("unit test return value = "..returnValue)

if (returnValue == 0) then
    playdate.graphics.drawText("*SUCCESS*", 166, 180)
else
    playdate.graphics.drawText("*FAIL*", 185, 180)
end
