require "luaminx.move.utils.kilominx_rotate_utils"

-- X Y Z Moves
-- @author: LucaGoubelle

KiloAxisMoves = {}

function KiloAxisMoves:new()
    local obj = {
        ru = KilominxRotateUtils:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

--------------------------------------------
------- Y MOVES ----------------------------
--------------------------------------------

function KiloAxisMoves:moveY(cube)
    -- TODO: implement this
    return cube
end

function KiloAxisMoves:moveYPrime(cube)
    for i = 1,3 do
        cube = self:moveY(cube)
    end
    return cube
end

function KiloAxisMoves:moveY2(cube)
    for i = 1,2 do
        cube = self:moveY(cube)
    end
    return cube
end
