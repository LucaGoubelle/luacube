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
    local back = CubeBuilder:_buildFace(size, "green")
    local up = CubeBuilder:_buildFace(size, "yellow")
    local front = CubeBuilder:_buildFace(size, "blue")
    local left = CubeBuilder:_buildFace(size, "orange")
    local right = CubeBuilder:_buildFace(size, "red")
    local down = CubeBuilder:_buildFace(size, "white")
    return Cube:new(back, up, front, left, right, down)
end
