require "luaminx.data.minx"

-- megaminx builder
-- @author: LucaGoubelle

MegaminxBuilder = {}

function MegaminxBuilder:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MegaminxBuilder:_buildFace(elem)
    -- declare face elems
    local face = {}
    local ring1 = {}
    local ring2 = {}
    -- complete first ring
    for i=1,10 do
        table.insert(ring1, elem)
    end
    -- add only one value to last ring (center piece)
    table.insert(ring2, elem)
    -- merge all
    table.insert(face, ring1)
    table.insert(face, ring2)
    -- return the generated face
    return face
end

function MegaminxBuilder:build()
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
