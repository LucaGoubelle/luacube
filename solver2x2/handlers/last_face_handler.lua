require "luacube.move.mover"
-- last face handler
LastFaceHandler={}

function LastFaceHandler:new()
    local obj = {
        mover = Mover:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function LastFaceHandler:handleOLL(cube)
    -- todo: implement this
    return cube
end

function LastFaceHandler:handlePLL(cube)
    -- todo: implement this
    return cube
end

function LastFaceHandler:handleAUF(cube)
    local color = cube.front[1][1]
    local hmap = {
        red = "U'",
        orange = "U",
        green = "U2"
    }
    cube = self.mover:multiMoves(cube, hmap[color] or "???")
    return cube
end

function LastFaceHandler:handle(cube)
    cube = self:handleOLL(cube)
    cube = self:handlePLL(cube)
    cube = self:handleAUF(cube)
    return cube
end
