require "luacube.move.rotate_helpers"
-- STDs moves
-- @author: LucaGoubelle

local _rh = RotateHelpers:new()

AxisMoves = {}

function AxisMoves:new()
    local obj = {}
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
        cube = AxisMoves:moveY(cube)
    end
    return cube
end

function AxisMoves:moveY2(cube)
    for i = 1,2 do
        cube = AxisMoves:moveY(cube)
    end
    return cube
end

-- todo: implement x, y, z 
