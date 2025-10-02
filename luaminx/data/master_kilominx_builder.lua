require "luaminx.data.minx"

-- master kilominx builder
-- @author: LucaGoubelle

MasterKilominxBuilder = {}

function MasterKilominxBuilder:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MasterKilominxBuilder:_buildFace(elem)
    local face = {}
    local ring1 = {}
    local ring2 = {}
    for i=1,15 do
        table.insert(ring1, elem)
    end
    for i=1,5 do
        table.insert(ring2, elem)
    end
    -- merge face rings
    table.insert(face, ring1)
    table.insert(face, ring2)
    return face
end

-----------------------------------------
------ CALLABLE PART --------------------
-----------------------------------------

function MasterKilominxBuilder:build()
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