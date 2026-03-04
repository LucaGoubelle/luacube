-- solver 3x3
-- @author: LucaGoubelle
Solver3x3={}

function Solver3x3:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Solver3x3:solve(cube)
    -- todo: implement this
    return cube
end
