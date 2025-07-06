require "luacube.move.rotate_helpers"
-- STDs moves
-- @author: LucaGoubelle

local _rh = RotateHelpers:new()

STDMoves = {}

function STDMoves:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function STDMoves:moveU(cube)
    -- todo: implement this
    return cube
end

function STDMoves:moveUPrime(cube)
    for i = 1,3 do
        cube = STDMoves:moveU(cube)
    end
    return cube
end

function STDMoves:moveU2(cube)
    for i = 1,2 do
        cube = STDMoves:moveU(cube)
    end
    return cube
end

-- todo: implement D, L, R, F...