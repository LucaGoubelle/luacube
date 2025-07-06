require "luacube.move.rotate_helpers"

-- STDs moves
-- @author: LucaGoubelle
AxisMoves = {}

function AxisMoves:new()
    local obj = {
        rh = RotateHelpers:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function AxisMoves:moveY(cube)
    -- todo: implement this
    return cube
end

function AxisMoves:moveYPrime(cube)
    for i = 1,3 do
        cube = self:moveY(cube)
    end
    return cube
end

function AxisMoves:moveY2(cube)
    for i = 1,2 do
        cube = self:moveY(cube)
    end
    return cube
end


function AxisMoves:moveX(cube)
    -- todo: implement this
    return cube
end

function AxisMoves:moveXPrime(cube)
    for i = 1,3 do
        cube = self:moveX(cube)
    end
    return cube
end

function AxisMoves:moveX2(cube)
    for i = 1,2 do
        cube = self:moveX(cube)
    end
    return cube
end


function AxisMoves:moveZ(cube)
    -- todo: implement this
    return cube
end

function AxisMoves:moveZPrime(cube)
    for i = 1,3 do
        cube = self:moveZ(cube)
    end
    return cube
end

function AxisMoves:moveZ2(cube)
    for i = 1,2 do
        cube = self:moveZ(cube)
    end
    return cube
end