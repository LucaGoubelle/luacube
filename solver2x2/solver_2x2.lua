-- solver 2x2
-- @author: LucaGoubelle
Solver2x2={}

function Solver2x2:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Solver2x2:solve(cube)
    -- todo: implement this
    return cube
end
