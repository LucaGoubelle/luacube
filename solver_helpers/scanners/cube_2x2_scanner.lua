-- cube 2x2 scanner
-- @author: LucaGoubelle

Cube2x2Scanner={}

function Cube2x2Scanner:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Cube2x2Scanner:scanCorner(cube, orient)
    local size = #cube.front
    local hmap = {
        up_front_right = cube.up[size][size].."_"..cube.front[1][size].."_"..cube.right[1][1],
        up_front_left = cube.up[size][1].."_"..cube.front[1][1].."_"..cube.left[1][size],
        up_back_left = cube.up[1][1].."_"..cube.back[1][size].."_"..cube.left[1][1],
        up_back_right = cube.up[1][size].."_"..cube.back[1][1].."_"..cube.right[1][size],
        
        down_front_left = cube.down[1][1].."_"..cube.front[size][1].."_"..cube.left[size][size],
        down_front_right = cube.down[1][size].."_"..cube.front[size][size].."_"..cube.right[size][1],
        down_back_left= cube.down[size][1].."_"..cube.back[size][size].."_"..cube.left[size][1],
        down_back_right = cube.down[size][size].."_"..cube.back[size][1].."_"..cube.right[size][size]
    }
    return hmap[orient] or "???"
end

function Cube2x2Scanner:scanCorners(cube)
    local hmap = {
        up_front_left=self:scanCorner(cube, "up_front_left"),
        up_front_right=self:scanCorner(cube, "up_front_right"),
        up_back_left=self:scanCorner(cube, "up_back_left"),
        up_back_right=self:scanCorner(cube, "up_back_right"),

        down_front_left=self:scanCorner(cube, "down_front_left"),
        down_front_right=self:scanCorner(cube, "down_front_right"),
        down_back_left=self:scanCorner(cube, "down_back_left"),
        down_back_right=self:scanCorner(cube, "down_back_right")
    }
    return hmap
end
