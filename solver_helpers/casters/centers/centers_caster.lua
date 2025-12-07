-- centers caster
-- @author: LucaGoubelle
CentersCaster={}

function CentersCaster:new()
    local obj = {
        size = 0
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CentersCaster:_getActualFace(cube, face)
    if face == "up" then return cube.up
    elseif face == "front" then return cube.front
    elseif face == "left" then return cube.left
    elseif face == "right" then return cube.right
    elseif face == "down" then return cube.down
    elseif face == "back" then return cube.back
    else return cube.front end
end

function CentersCaster:_getStringCenters(colorToFilter, centers)
    local content = ""
    for _, row in pairs(centers) do
        for _, elem in pairs(row) do
            content = content .. (elem==colorToFilter and "T" or "F")
        end
    end
    return content
end

function CentersCaster:_extractCenters(actualFace)
    local centers = {}
    return centers
end

function CentersCaster:cast(cube, face, colorToFilter)
    local actualFace = self:_getActualFace(cube, face)
    local actualCenters = self:_extractCenters(actualFace)
    return self:_getStringCenters(colorToFilter, actualCenters)
end
