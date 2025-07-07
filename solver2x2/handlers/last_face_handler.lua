-- last face handler
LastFaceHandler={}

function LastFaceHandler:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function LastFaceHandler:handle(cube)
    -- todo: implement this
    return cube
end
