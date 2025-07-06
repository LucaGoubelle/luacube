require "luacube.move.std_moves"
require "luacube.move.axis_moves"

-- cube mover
-- @author: LucaGoubelle
Mover={}

function Mover:new()
    local obj = {
        _stdMoves = STDMoves:new(),
        _axisMoves = AxisMoves:new()
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
