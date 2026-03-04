require "luacube.move.mover"

-- handler mother table
Handler={}

function Handler:new()
    local obj = {
        mover = Mover:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
