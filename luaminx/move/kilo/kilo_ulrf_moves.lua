require "luaminx.move.utils.kilominx_rotate_utils"

-- U L R F Moves
-- @author: LucaGoubelle

KiloULRFMoves = {}

function KiloULRFMoves:new()
    local obj = {
        ru = KilominxRotateUtils:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-------------------------------------------
---------- U MOVES ------------------------
-------------------------------------------

function KiloULRFMoves:moveU(cube)
    -- TODO: implement this
    return cube
end

function KiloULRFMoves:moveUPrime(cube)
    for i = 1,3 do
        cube = self:moveU(cube)
    end
    return cube
end

function KiloULRFMoves:moveU2(cube)
    for i = 1,2 do
        cube = self:moveU(cube)
    end
    return cube
end

-------------------------------------------
---------- L MOVES ------------------------
-------------------------------------------

function KiloULRFMoves:moveL(cube)
    -- TODO: implement this
    return cube
end

function KiloULRFMoves:moveLPrime(cube)
    for i = 1,3 do
        cube = self:moveL(cube)
    end
    return cube
end

function KiloULRFMoves:moveL2(cube)
    for i = 1,2 do
        cube = self:moveL(cube)
    end
    return cube
end

-------------------------------------------
---------- R MOVES ------------------------
-------------------------------------------

function KiloULRFMoves:moveR(cube)
    -- TODO: implement this
    return cube
end

function KiloULRFMoves:moveRPrime(cube)
    for i = 1,3 do
        cube = self:moveR(cube)
    end
    return cube
end

function KiloULRFMoves:moveR2(cube)
    for i = 1,2 do
        cube = self:moveR(cube)
    end
    return cube
end

-------------------------------------------
---------- F MOVES ------------------------
-------------------------------------------

function KiloULRFMoves:moveF(cube)
    -- TODO: implement this
    return cube
end

function KiloULRFMoves:moveFPrime(cube)
    for i = 1,3 do
        cube = self:moveF(cube)
    end
    return cube
end

function KiloULRFMoves:moveF2(cube)
    for i = 1,2 do
        cube = self:moveF(cube)
    end
    return cube
end
