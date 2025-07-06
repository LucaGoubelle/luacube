require "luacube.move.rotate_helpers"

-- STDs moves
-- @author: LucaGoubelle
STDMoves = {}

function STDMoves:new()
    local obj = {
        rh = RotateHelpers:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function STDMoves:moveU(cube)
    local size = #cube.up

    cube.up = self.rh:rotate(cube.up)

    local newFront = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for i = 1, size do
        newFront[1][i] = cube.right[1][i]
        newLeft[1][i] = cube.front[1][i]
        newRight[1][i] = cube.back[1][i]
        newBack[1][i] = cube.left[1][i]
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.back = self.rh:transfert(cube.back, newBack)

    return cube
end

function STDMoves:moveUPrime(cube)
    for i = 1,3 do
        cube = self:moveU(cube)
    end
    return cube
end

function STDMoves:moveU2(cube)
    for i = 1,2 do
        cube = self:moveU(cube)
    end
    return cube
end

-- todo: implement D, L, R, F...