-- cubestr dumper
-- @author: LucaGoubelle

CubeStrDumper = {}

function CubeStrDumper:new()
    local obj = {
        hmap = {
            green="G",
            blue="B",
            red="R",
            orange="O",
            white="W",
            yellow="Y",
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-----------------------------------
-------LOGIC METHODS --------------
-----------------------------------

function CubeStrDumper:_dumpFace(face)
    local content = ""
    for _,row in pairs(face) do
        for _,elem in pairs(row) do
            content = content .. self.hmap[elem]
        end
    end
    return content
end

-----------------------------------
-------CALLABLE METHODS -----------
-----------------------------------

function CubeStrDumper:dump(cube)
    local content = ""
    content = content .. self:_dumpFace(cube.back) .. "_"
    content = content .. self:_dumpFace(cube.up) .. "_"
    content = content .. self:_dumpFace(cube.front) .. "_"
    content = content .. self:_dumpFace(cube.left) .. "_"
    content = content .. self:_dumpFace(cube.right) .. "_"
    content = content .. self:_dumpFace(cube.down)
    return content
end
