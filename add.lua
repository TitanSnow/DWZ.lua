--[[
    Lua.DWZ Project
    Author xtl<xtl@xtlsoft.top>
--]]

include ("lib")
include ("lib/tpl")
include ("lib/file")
include ("lib/json")

if php.post.url == nil then
    print("Wrong Request!")
    php.eval("die();")
end

json = json2lua(file.getContent("data.txt"))

json[php.post.short] = php.post.url

file.putContent("data.txt", lua2json(json))

tpl.show("addSuccess", {})