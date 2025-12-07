-- oll scanner
-- @author: LucaGoubelle
F2LScanner={}

function F2LScanner:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function F2LScanner:scanPairLeft(cube)
    local content = cube.up[3][2] .. "_" .. cube.front[1][2] .. "::"
    content = content .. cube.up[3][3] .. "_" .. cube.front[1][3] .."_" .. cube.right[1][1]
    return content
end

function F2LScanner:scanPairRight(cube)
    local content = cube.up[2][3] .. "_" .. cube.right[1][2] .. "::"
    content = content .. cube.up[3][3] .. "_" .. cube.right[1][1] .. "_" .. cube.front[1][3]
    return content
end

