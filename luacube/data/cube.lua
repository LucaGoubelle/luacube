-- cube instance
-- @author: LucaGoubelle

Cube = {}

function Cube:new(back,up,front,left,right,down)
    local obj = {
        back=back,
        up=up,
        front=front,
        left=left,
        right=right,
        down=down
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

