function _G.json2lua(obj)
    
    return php.call("json_decode", {obj, 1})
    
end

function _G.lua2json(obj)
    -- Woops, Not finished.
    -- Use A php function.
    
    return php.call("json_encode", {obj})
end