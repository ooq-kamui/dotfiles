
-- require path, add
local CONFIG_DIR = hs.fs.pathToAbsolute(hs.configdir .. "/init.lua"):match("(.*)/")
package.path = CONFIG_DIR .. "/?.lua;" .. package.path

require("cursor_circle")

