require "luacube.move.rotate_helpers"

-- W Moves
-- @author: LucaGoubelle
WMoves={}

function WMoves:new()
    local obj = {
        rh = RotateHelpers:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function WMoves:moveUw(cube, nbLayers)
    nbLayers = nbLayers or 2 -- if not specified
    local size = #cube.up
    cube.up = self.rh:rotate(cube.up)

    local newFront = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for j = 1, nbLayers do
        for i = 1, size do
            newFront[j][i] = cube.right[j][i]
            newRight[j][i] = cube.back[j][i]
            newLeft[j][i] = cube.front[j][i]
            newBack[j][i] = cube.left[j][i]
        end
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.back = self.rh:transfert(cube.back, newBack)
    
    return cube
end

function WMoves:moveUwPrime(cube, nbLayers)
    for i = 1,3 do
        cube = self:moveUw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveUw2(cube, nbLayers)
    for i = 1,2 do
        cube = self:moveUw(cube, nbLayers)
    end
    return cube
end



function WMoves:moveDw(cube, nbLayers)
    nbLayers = nbLayers or 2
    local size = #cube.down
    cube.down = self.rh:rotate(cube.down)

    local newFront = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for j = 1, nbLayers do
        for i = 1, size do
            newFront[size-(j-1)][i] = cube.left[size-(j-1)][i]
            newLeft[size-(j-1)][i] = cube.back[size-(j-1)][i]
            newRight[size-(j-1)][i] = cube.front[size-(j-1)][i]
            newBack[size-(j-1)][i] = cube.right[size-(j-1)][i]
        end
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.back = self.rh:transfert(cube.back, newBack)

    return cube
end

function WMoves:moveDwPrime(cube, nbLayers)
    for i = 1,3 do
        cube = self:moveDw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveDw2(cube, nbLayers)
    for i = 1,2 do
        cube = self:moveDw(cube, nbLayers)
    end
    return cube
end


function WMoves:moveLw(cube, nbLayers)
    nbLayers = nbLayers or 2
    local size = #cube.left
    cube.left = self.rh:rotate(cube.left)

    local newUp = self.rh:genEmptyFace(size)
    local newFront = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)

    for j = 1, nbLayers do
        for i = 1, size do
            newFront[i][j] = cube.up[i][j]
            newDown[i][j] = cube.front[i][j]
            newBack[i][j] = cube.down[i][j]
            newUp[i][size-(j-1)] = cube.back[i][size-(j-1)]
        end
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.up = self.rh:transfert(cube.up, self.rh:rotateTwice(newUp))
    cube.down = self.rh:transfert(cube.down, newDown)
    cube.back = self.rh:transfert(cube.back, self.rh:rotateTwice(newBack))

    return cube
end

function WMoves:moveLwPrime(cube, nbLayers)
    for i = 1,3 do
        cube = self:moveLw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveLw2(cube, nbLayers)
    for i = 1,2 do
        cube = self:moveLw(cube, nbLayers)
    end
    return cube
end



function WMoves:moveRw(cube, nbLayers)
    nbLayers = nbLayers or 2
    local size = #cube.right
    cube.right = self.rh:rotate(cube.right)

    local newFront = self.rh:genEmptyFace(size)
    local newUp = self.rh:genEmptyFace(size)
    local newBack = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)

    for j = 1, nbLayers do
        for i = 1, size do
            newFront[i][size-(j-1)] = cube.down[i][size-(j-1)]
            newUp[i][size-(j-1)] = cube.front[i][size-(j-1)]
            newBack[i][size-(j-1)] = cube.up[i][size-(j-1)]
            newDown[i][j] = cube.back[i][j]
        end
    end

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.up = self.rh:transfert(cube.up, newUp)
    cube.back = self.rh:transfert(cube.back, self.rh:rotateTwice(newBack))
    cube.down = self.rh:transfert(cube.down, self.rh:rotateTwice(newDown))

    return cube
end

function WMoves:moveRwPrime(cube, nbLayers)
    for i = 1,3 do
        cube = self:moveRw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveRw2(cube, nbLayers)
    for i = 1,2 do
        cube = self:moveRw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveFw(cube, nbLayers)
    nbLayers = nbLayers or 2
    local size = #cube.front
    cube.front = self.rh:rotate(cube.front)

    local newUp = self.rh:genEmptyFace(size)
    local newLeft = self.rh:genEmptyFace(size)
    local newRight = self.rh:genEmptyFace(size)
    local newDown = self.rh:genEmptyFace(size)

    for j = 1, nbLayers do
        for i = 1, size do
            newUp[i][size-(j-1)] = cube.left[i][size-(j-1)]
            newLeft[j][i] = cube.down[j][i]
            newRight[size-(j-1)][i] = cube.up[size-(j-1)][i]
            newDown[i][j] = cube.right[i][j]
        end
    end

    cube.up = self.rh:transfert(cube.up, self.rh:rotate(newUp))
    cube.left = self.rh:transfert(cube.left, self.rh:rotate(newLeft))
    cube.right = self.rh:transfert(cube.right, self.rh:rotate(newRight))
    cube.down = self.rh:transfert(cube.down, self.rh:rotate(newDown))

    return cube
end

function WMoves:moveFwPrime(cube, nbLayers)
    for i = 1,3 do
        cube = self:moveFw(cube, nbLayers)
    end
    return cube
end

function WMoves:moveFw2(cube, nbLayers)
    for i = 1,2 do
        cube = self:moveFw(cube, nbLayers)
    end
    return cube
end
