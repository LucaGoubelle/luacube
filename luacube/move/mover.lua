require "luacube.move.std_moves"
require "luacube.move.axis_moves"

local _stdMoves = STDMoves:new()
local _axisMoves = AxisMoves:new()

-- cube mover
-- @author: LucaGoubelle
Mover={}

function Mover:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---------------------------------
--todo: implement methods here --
---------------------------------

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
    if mv == "U" then cube = _stdMoves:moveU(cube)
    elseif mv == "U'" then cube = _stdMoves:moveUPrime(cube)
    elseif mv == "U2" then cube = _stdMoves:moveU2(cube)
    elseif mv == "y" then cube = _axisMoves:moveY(cube)
    elseif mv == "y'" then cube = _axisMoves:moveYPrime(cube)
    elseif mv == "y2" then cube = _axisMoves:moveY2(cube)
    else cube = cube end
    return cube
end

function Mover:multiMoves(cube, mvs)
    local mvTab = _spliting(mvs)
    for _,mv in pairs(mvTab) do
        cube = Mover:simpleMove(cube, mv)
    end
    return cube
end
