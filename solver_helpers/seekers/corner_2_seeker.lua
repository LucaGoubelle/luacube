require "solver_helpers.scanners.cube_2x2_scanner"
-- corner 2 seeker
-- @author: LucaGoubelle
Corner2Seeker={}

function Corner2Seeker:new()
    local obj = {
        scanner = Cube2x2Scanner:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Corner2Seeker:_table_contains(tbl, x)
    found = false
    for _, v in pairs(tbl) do
        if v == x then 
            found = true 
        end
    end
    return found
end

function Corner2Seeker:seekCorner(cube, possibilities)
    local targetedOrients = ""
    local targetedColors = ""
    local corners = self.scanner:scanCorners(cube)
    for k,v in pairs(corners) do
        if self:_table_contains(possibilities, v) then
            targetedOrients = k
            targetedColors = v
            break
        end
    end
    return targetedOrients.."__"..targetedColors   
end
