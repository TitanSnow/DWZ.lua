--[[
    Lua.DWZ Project
    Author xtl<xtl@xtlsoft.top>
--]]

include ("lib")
include ("lib/tpl")

local data = {
    title = "Lua.DWZ",
    base  = php.server.HTTP_HOST .. php.call("dirname", { php.server.PHP_SELF })
}

tpl.show("index", data)