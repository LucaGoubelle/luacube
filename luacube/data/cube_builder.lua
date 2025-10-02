require "luacube.data.cube"

-- cube builder object
-- @author: LucaGoubelle

CubeBuilder = {}

function CubeBuilder:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CubeBuilder:_buildFace(size, elem)
    local face = {}
    for i = 1,size do
        local row = {}
        for j = 1,size do
            table.insert(row, elem)
        end
        table.insert(face, row)
    end
    return face
end

-------------------------------
-- callable part
-------------------------------

function CubeBuilder:build(size)
    local back = self:_buildFace(size, "green")
    local up = self:_buildFace(size, "yellow")
    local front = self:_buildFace(size, "blue")
    local left = self:_buildFace(size, "orange")
    local right = self:_buildFace(size, "red")
    local down = self:_buildFace(size, "white")
    
    return Cube:new(back, up, front, left, right, down)
end
