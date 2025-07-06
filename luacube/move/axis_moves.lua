require "luacube.move.rotate_helpers"

-- STDs moves
-- @author: LucaGoubelle
AxisMoves = {}

function AxisMoves:new()
    local obj = {
        rh = RotateHelpers:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function AxisMoves:moveY(cube)
    cube.up = self.rh:rotate(cube.up)
    cube.down = self.rh:rotateAsync(cube.down)

    local newFront = self.rh:copyFace(cube.right)
    local newLeft = self.rh:copyFace(cube.front) 
    local newRight = self.rh:copyFace(cube.back)
    local newBack = self.rh:copyFace(cube.left)

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.back = self.rh:transfert(cube.back, newBack)

    return cube
end

function AxisMoves:moveYPrime(cube)
    for i = 1,3 do
        cube = self:moveY(cube)
    end
    return cube
end

function AxisMoves:moveY2(cube)
    for i = 1,2 do
        cube = self:moveY(cube)
    end
    return cube
end


function AxisMoves:moveX(cube)
    cube.right = self.rh:rotate(cube.right)
    cube.left = self.rh:rotateAsync(cube.left)

    local newFront = self.rh:copyFace(cube.down)
    local newUp = self.rh:copyFace(cube.front)
    local newBack = self.rh:rotateTwice(self.rh:copyFace(cube.up))
    local newDown = self.rh:rotateTwice(self.rh:copyFace(cube.back))

    cube.front = self.rh:transfert(cube.front, newFront)
    cube.up = self.rh:transfert(cube.up, newUp)
    cube.back = self.rh:transfert(cube.back, newBack)
    cube.down = self.rh:transfert(cube.down, newDown)
    
    return cube
end

function AxisMoves:moveXPrime(cube)
    for i = 1,3 do
        cube = self:moveX(cube)
    end
    return cube
end

function AxisMoves:moveX2(cube)
    for i = 1,2 do
        cube = self:moveX(cube)
    end
    return cube
end


function AxisMoves:moveZ(cube)
    cube.front = self.rh:rotate(cube.front)
    cube.back = self.rh:rotateAsync(cube.back)

    local newUp = self.rh:rotate(self.rh:copyFace(cube.left))
    local newRight = self.rh:rotate(self.rh:copyFace(cube.up))
    local newLeft = self.rh:rotate(self.rh:copyFace(cube.down))
    local newDown = self.rh:rotate(self.rh:copyFace(cube.right))

    cube.up = self.rh:transfert(cube.up, newUp)
    cube.right = self.rh:transfert(cube.right, newRight)
    cube.left = self.rh:transfert(cube.left, newLeft)
    cube.down = self.rh:transfert(cube.down, newDown)

    return cube
end

function AxisMoves:moveZPrime(cube)
    for i = 1,3 do
        cube = self:moveZ(cube)
    end
    return cube
end

function AxisMoves:moveZ2(cube)
    for i = 1,2 do
        cube = self:moveZ(cube)
    end
    return cube
end