import 'luaunit/playdate_luaunit_fix'
import 'luaunit/luaunit'

import 'element-tests/test_button'
import 'element-tests/test_toggle'

import 'puzzle-tests/test_puzzle001'
import 'puzzle-tests/test_puzzle001a'
import 'puzzle-tests/test_puzzle001b'
import 'puzzle-tests/test_puzzle001c'
import 'puzzle-tests/test_puzzle001d'
import 'puzzle-tests/test_puzzle002'
import 'puzzle-tests/test_puzzle003'


-- turns off updating
playdate.stop()

-- when outputting a table, include a table address
luaunit.PRINT_TABLE_REF_IN_ERROR_MSG = true

-- process the command line args (if any)
-- local testOutputFilename = "test_output"
-- local outputType = "text"
local luaunit_args = {'--output', 'text', '--verbose'}
-- luaunit_args notes
-- --output: text or tap
-- removed -r because no value

-- run the tests
local returnValue = luaunit.LuaUnit.run(table.unpack(luaunit_args))

print("unit test return value = "..returnValue)

if (returnValue == 0) then
    playdate.graphics.drawText("*SUCCESS*", 166, 180)
else
    playdate.graphics.drawText("*FAIL*", 185, 180)
end
