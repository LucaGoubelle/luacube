-- handler mother table
-- author: LucaGoubelle
require "luacube.move.mover"

Handler={}

function Handler:new()
    local obj = {
        mover = Mover:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end


