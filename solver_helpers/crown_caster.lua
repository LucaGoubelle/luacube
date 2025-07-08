-- crown caster
-- @author: LucaGoubelle
CrownCaster={}

function CrownCaster:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CrownCaster:cast(crown)
    local result = ""
    for _,row in pairs(crown) do
        for _,elem in pairs(row) do
            result = result..(elem=="yellow" and "T" or "F")
        end
        result = result.."_"
    end
    return result
end
