--[[
    Lua.DWZ Project
    Author xtl<xtl@xtlsoft.top>
--]]

include ("lib")
include ("lib/tpl")
include ("lib/json")
include ("lib/file")

short = ""

for k, v in pairs(php.get) do
    if v == "" then
        short = k
    end
end

if short == "" then
    php.call("die", { "No such url." })
end

json = json2lua(file.getContent("data.txt"))

url = json[short]

json = nil

php.call("header", { "location: " .. url })