require "luaminx.data.minx"

-- kilominx builder
-- @author: LucaGoubelle

KilominxBuilder = {}

function KilominxBuilder:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function KilominxBuilder:_buildFace(elem)
    local face = {}
    for i=1,5 do
        table.insert(face, elem)
    end
    return face
end

-----------------------------------------
------ CALLABLE PART --------------------
-----------------------------------------

function KilominxBuilder:build()
    local up = self:_buildFace("grey")
    local front = self:_buildFace("magenta")
    local left = self:_buildFace("lime")
    local right = self:_buildFace("beige")
    local downleft = self:_buildFace("blue")
    local downright = self:_buildFace("red")

    local absleft = self:_buildFace("yellow")
    local absright = self:_buildFace("green")
    local backleft = self:_buildFace("orange")
    local backright = self:_buildFace("cyan")
    local back = self:_buildFace("purple")
    local down = self:_buildFace("white")
    
    return Minx:new(up, front, left, right, downleft, downright, absleft, absright, backleft, backright, back, down)
end
