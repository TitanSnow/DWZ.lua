--[[
    Lua.DWZ Project
    Author xtl<xtl@xtlsoft.top>
--]]

include ("lib/file")

tpl = {}

function tpl.show(tplName, vars)
    local tpl = file.getContent(_tpl_dir .. tplName .. '.html')
    for k, v in pairs(vars) do
        tpl = php.call("str_replace", { ("${" .. k .. "}"), v, tpl })
    end
    print(tpl)
end