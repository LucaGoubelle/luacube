-- cube dumper object
-- @author: LucaGoubelle

CubeDumper = {}

function CubeDumper:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-----------------------------------
-------LOGIC METHODS --------------
-----------------------------------

function CubeDumper:_dumpRow(row)
    local content = "[ "
    for _,elem in pairs(row) do
        content = content.."\""..elem.."\", "
    end
    content = content:sub(1,-3) -- remove 2 last chars
    content = content.." ], "
    return content
end

function CubeDumper:_dumpFace(face, name)
    local content = "\""..name.."\": [ "
    for _,row in pairs(face) do
        content = content..self:_dumpRow(row)
    end
    content = content:sub(1,-3) -- remove 2 last chars
    content = content.." ],\n"
    return content
end

-----------------------------------
-------CALLABLE METHODS -----------
-----------------------------------

function CubeDumper:dump(cube) -- cube nil ???
    local content = "{\n"
    content = content..self:_dumpFace(cube.back, "back")
    content = content..self:_dumpFace(cube.up, "up")
    content = content..self:_dumpFace(cube.front, "front")
    content = content..self:_dumpFace(cube.left, "left")
    content = content..self:_dumpFace(cube.right, "right")
    content = content..self:_dumpFace(cube.down, "down")
    content = content:sub(1,-3)
    content = content.."\n}\n"
    return content
end
