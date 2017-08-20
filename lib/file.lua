--[[
    Lua.DWZ Project
    Author xtl<xtl@xtlsoft.top>
--]]

file = {}

function file.getContent(fileName)
    local fileName = php.eval("return __DIR__;") .. '/' .. fileName;
    local f = io.open(fileName, "r")
    local buffer = ""
    local content = ""
    
    while(buffer) do
        buffer = f:read();
        if(buffer) then
            content = content .. buffer .. "\n"
        end
    end
    
    f:close()
    
    return content
end

function file.putContent(fileName, content)
    local fileName = php.eval("return __DIR__;") .. '/' .. fileName;
    local f = io.open(fileName, "w")
    local buffer = ""
    
    local stat = f:write(content)
    
    f:close()
    
    return stat
end

function file.writeEnd(fileName, content)
    local fileName = php.eval("return __DIR__;") .. '/' .. fileName;
    local f = io.open(fileName, "a")
    local buffer = ""
    
    local stat = f:write(content)
    
    f:close()
    
    return stat
end