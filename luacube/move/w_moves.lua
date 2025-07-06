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
