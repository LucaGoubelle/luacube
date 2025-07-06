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



function STDMoves:moveD(cube)
    local size = #cube.down
    cube.down = self.rh:rotate(cube.down)

    local newFront = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for i = 1, size do
        newFront[size][i] = cube.left[size][i]
        newLeft[size][i] = cube.back[size][i]
        newRight[size][i] = cube.front[size][i]
        newBack[size][i] = cube.right[size][i]
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.back = self.rh:transfert(cube.back, newBack)

    return cube
end

function STDMoves:moveDPrime(cube)
    for i = 1,3 do
        cube = self:moveD(cube)
    end
    return cube
end

function STDMoves:moveD2(cube)
    for i = 1,2 do
        cube = self:moveD(cube)
    end
    return cube
end


function STDMoves:moveL(cube)
    local size = #cube.left
    cube.left = self.rh:rotate(cube.left)

    local newUp = self.rh:genEmptyFace(size)
    local newFront = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for i = 1, size do
        newFront[i][1] = cube.up[i][1]
        newDown[i][1] = cube.front[i][1]
        newBack[i][1] = cube.down[i][1]
        newUp[i][size] = cube.back[i][size]
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.up = self.rh:transfert(cube.up, self.rh:rotateTwice(newUp))
    cube.down = self.rh:transfert(cube.down, newDown)
    cube.back = self.rh:transfert(cube.back, self.rh:rotateTwice(newBack))

    return cube
end

function STDMoves:moveLPrime(cube)
    for i = 1,3 do
        cube = self:moveL(cube)
    end
    return cube
end

function STDMoves:moveL2(cube)
    for i = 1,2 do
        cube = self:moveL(cube)
    end
    return cube
end


function STDMoves:moveR(cube)
    local size = #cube.up
    cube.right = self.rh:rotate(cube.right)
    
    local newFront = self.rh:genEmptyFace(size)
    local newUp = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)

    for i = 1, size do
        newFront[i][size] = cube.down[i][size]
        newUp[i][size] = cube.front[i][size]
        newBack[i][size] = cube.up[i][size]
        newDown[i][1] = cube.back[i][1]
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.up = self.rh:transfert(cube.up, newUp)
    cube.back = self.rh:transfert(cube.back, self.rh:rotateTwice(newBack))
    cube.down = self.rh:transfert(cube.down, self.rh:rotateTwice(newDown))

    return cube
end

function STDMoves:moveRPrime(cube)
    for i = 1,3 do
        cube = self:moveR(cube)
    end
    return cube
end

function STDMoves:moveR2(cube)
    for i = 1,2 do
        cube = self:moveR(cube)
    end
    return cube
end



function STDMoves:moveF(cube)
    local size = #cube.front
    cube.front = self.rh:rotate(cube.front)

    local newUp = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)

    for i = 1, size do
        newUp[i][size] = cube.left[i][size]
        newLeft[1][i] = cube.down[1][i]
        newRight[size][i] = cube.up[size][i]
        newDown[i][1] = cube.right[i][1]
    end

    cube.up = self.rh:transfert(cube.up, self.rh:rotate(newUp))
    cube.left = self.rh:transfert(cube.left, self.rh:rotate(newLeft))
    cube.right = self.rh:transfert(cube.right, self.rh:rotate(newRight))
    cube.down = self.rh:transfert(cube.down, self.rh:rotate(newDown))

    return cube
end

function STDMoves:moveFPrime(cube)
    for i = 1,3 do
        cube = self:moveF(cube)
    end
    return cube
end

function STDMoves:moveF2(cube)
    for i = 1,2 do
        cube = self:moveF(cube)
    end
    return cube
end
