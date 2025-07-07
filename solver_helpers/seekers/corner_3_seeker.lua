require "solver_helpers.scanners.cube_3x3_scanner"
-- corner 3 seeker
-- @author: LucaGoubelle
Corner3Seeker={}

function Corner3Seeker:new()
    local obj = {
        scanner = Cube3x3Scanner:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Corner3Seeker:_table_contains(tbl, x)
    found = false
    for _, v in pairs(tbl) do
        if v == x then 
            found = true 
        end
    end
    return found
end

function Corner3Seeker:seekCorner(cube, possibilities)
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
