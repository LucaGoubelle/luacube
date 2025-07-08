-- crown scanner
-- @author: LucaGoubelle
CrownScanner = {}

function CrownScanner:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

--------------------------------------------------
-- LOGIC METHODS ---------------------------------
--------------------------------------------------

function CrownScanner:_scanBackOfCrown(cube)
    local len = #cube.up
    local row = {}
    for i = len, 1, -1 do
        table.insert(row, cube.back[1][i])
    end
    return row
end

function CrownScanner:_scanFrontOfCrown(cube)
    local len = #cube.up
    local row = {}
    for i = 1, len do
        table.insert(row, cube.front[1][i])
    end
    return row
end

function CrownScanner:_scanUpOfCrown(cube, index)
    local len = #cube.up
    local row = {}
    table.insert(row, cube.left[1][index])
    for i = 1, len do
        table.insert(row, cube.up[index][i])
    end
    table.insert(row, cube.right[1][len+1-index])
    return row
end

--------------------------------------------------
-- CALLABLES METHODS -----------------------------
--------------------------------------------------

function CrownScanner:scanCrown(cube)
    local crown = {}
    local len = #cube.up
    table.insert(crown, self:_scanBackOfCrown(cube))
    for i = 1, len do
        table.insert(crown, self:_scanUpOfCrown(cube, i))
    end
    table.insert(crown, self:_scanFrontOfCrown(cube))
    return crown
end
