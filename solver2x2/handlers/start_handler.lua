-- start handler
StartHandler={}

function StartHandler:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function StartHandler:handle(cube)
    -- todo: implement this
    return cube
end
