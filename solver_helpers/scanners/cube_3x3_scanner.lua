require "solver_helpers.scanners.cube_2x2_scanner"
-- cube 3x3 scanner
-- @author: LucaGoubelle

Cube3x3Scanner=Cube2x2Scanner:new()

function Cube3x3Scanner:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Cube3x3Scanner:scanCenter(cube, orient)
    local hmap = {
        back=cube.back[2][2],
        up=cube.up[2][2],
        front=cube.front[2][2],
        left=cube.left[2][2],
        right=cube.right[2][2],
        down=cube.down[2][2],
    }
    return hmap[orient] or "???"
end

function Cube3x3Scanner:scanEdge(cube, orient)
    local hmap = {}
    hmap["up_front"] = cube.up[3][2].."_"..cube.front[1][2]
    hmap["up_right"] = cube.up[2][3].."_"..cube.right[1][2]
    hmap["up_left"] = cube.up[2][1].."_"..cube.left[1][2]
    hmap["up_back"] = cube.up[1][2].."_"..cube.back[1][2]
    
    hmap["front_left"] = cube.front[2][1].."_"..cube.left[2][3]
    hmap["front_right"] = cube.front[2][3].."_"..cube.right[2][1]
    hmap["back_left"] = cube.back[2][3].."_"..cube.left[2][1]
    hmap["back_right"] = cube.back[2][1].."_"..cube.right[2][3]
    
    hmap["down_front"] = cube.down[1][2].."_"..cube.front[3][2]
    hmap["down_right"] = cube.down[2][3].."_"..cube.right[3][2]
    hmap["down_left"] = cube.down[2][1].."_"..cube.left[3][2]
    hmap["down_back"] = cube.down[3][2].."_"..cube.back[3][2]

    return hmap[orient] or "???"
end

function Cube3x3Scanner:scanEdges(cube)
    local hmap = {}
    hmap["up_front"] = self:scanEdge(cube, "up_front")
    hmap["up_left"] = self:scanEdge(cube, "up_left")
    hmap["up_right"] = self:scanEdge(cube, "up_right")
    hmap["up_back"] = self:scanEdge(cube, "up_back")

    hmap["front_left"] = self:scanEdge(cube, "front_left")
    hmap["front_right"] = self:scanEdge(cube, "front_right")
    hmap["back_left"] = self:scanEdge(cube, "back_left")
    hmap["back_right"] = self:scanEdge(cube, "back_right")

    hmap["down_front"] = self:scanEdge(cube, "down_front")
    hmap["down_left"] = self:scanEdge(cube, "down_left")
    hmap["down_right"] = self:scanEdge(cube, "down_right")
    hmap["down_back"] = self:scanEdge(cube, "down_back")
    return hmap
end
