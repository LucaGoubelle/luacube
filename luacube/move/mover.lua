require "luacube.move.std_moves"
require "luacube.move.axis_moves"
require "luacube.move.w_moves"

-- cube mover
-- @author: LucaGoubelle
Mover={}

function Mover:new()
    local obj = {
        _stdMoves = STDMoves:new(),
        _axisMoves = AxisMoves:new(),
        _wMoves = WMoves:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function _spliting(line, delimiter)
    local result = {}
    delimiter = delimiter or " "
    local regex = ("([^%s]+)"):format(delimiter)
    for each in line:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

function Mover:simpleMove(cube, mv)
    if mv == "U" then cube = self._stdMoves:moveU(cube)
    elseif mv == "U'" then cube = self._stdMoves:moveUPrime(cube)
    elseif mv == "U2" then cube = self._stdMoves:moveU2(cube)
    elseif mv == "D" then cube = self._stdMoves:moveD(cube)
    elseif mv == "D'" then cube = self._stdMoves:moveDPrime(cube)
    elseif mv == "D2" then cube = self._stdMoves:moveD2(cube)
    elseif mv == "R" then cube = self._stdMoves:moveR(cube)
    elseif mv == "R'" then cube = self._stdMoves:moveRPrime(cube)
    elseif mv == "R2" then cube = self._stdMoves:moveR2(cube)
    elseif mv == "L" then cube = self._stdMoves:moveL(cube)
    elseif mv == "L'" then cube = self._stdMoves:moveLPrime(cube)
    elseif mv == "L2" then cube = self._stdMoves:moveL2(cube)
    elseif mv == "F" then cube = self._stdMoves:moveF(cube)
    elseif mv == "F'" then cube = self._stdMoves:moveFPrime(cube)
    elseif mv == "F2" then cube = self._stdMoves:moveF2(cube)

    elseif mv == "Uw" then cube = self._wMoves:moveUw(cube)
    elseif mv == "Uw'" then cube = self._wMoves:moveUwPrime(cube)
    elseif mv == "Uw2" then cube = self._wMoves:moveUw2(cube)
    elseif mv == "Dw" then cube = self._wMoves:moveDw(cube)
    elseif mv == "Dw'" then cube = self._wMoves:moveDwPrime(cube)
    elseif mv == "Dw2" then cube = self._wMoves:moveDw2(cube)
    elseif mv == "Lw" then cube = self._wMoves:moveLw(cube)
    elseif mv == "Lw'" then cube = self._wMoves:moveLwPrime(cube)
    elseif mv == "Lw2" then cube = self._wMoves:moveLw2(cube)
    elseif mv == "Rw" then cube = self._wMoves:moveRw(cube)
    elseif mv == "Rw'" then cube = self._wMoves:moveRwPrime(cube)
    elseif mv == "Rw2" then cube = self._wMoves:moveRw2(cube)
    elseif mv == "Fw" then cube = self._wMoves:moveFw(cube)
    elseif mv == "Fw'" then cube = self._wMoves:moveFwPrime(cube)
    elseif mv == "Fw2" then cube = self._wMoves:moveFw2(cube)

    elseif mv == "y" then cube = self._axisMoves:moveY(cube)
    elseif mv == "y'" then cube = self._axisMoves:moveYPrime(cube)
    elseif mv == "y2" then cube = self._axisMoves:moveY2(cube)
    elseif mv == "x" then cube = self._axisMoves:moveX(cube)
    elseif mv == "x'" then cube = self._axisMoves:moveXPrime(cube)
    elseif mv == "x2" then cube = self._axisMoves:moveX2(cube)
    elseif mv == "z" then cube = self._axisMoves:moveZ(cube)
    elseif mv == "z'" then cube = self._axisMoves:moveZPrime(cube)
    elseif mv == "z2" then cube = self._axisMoves:moveZ2(cube)
    else cube = cube end
    return cube
end

function Mover:multiMoves(cube, mvs)
    local mvTab = _spliting(mvs)
    for _,mv in pairs(mvTab) do
        cube = self:simpleMove(cube, mv)
    end
    return cube
end
