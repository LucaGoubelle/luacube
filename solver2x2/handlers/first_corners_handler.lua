-- first corner handler
FirstCornerHandler={}

function FirstCornerHandler:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function FirstCornerHandler:handle(cube)
    -- todo: implement this
    return cube
end
