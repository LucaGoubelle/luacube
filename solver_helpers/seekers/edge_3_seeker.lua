require "solver_helpers.scanners.cube_3x3_scanner"
-- edge 3 seeker
-- @author: LucaGoubelle
Edge3Seeker={}

function Edge3Seeker:new()
    local obj = {
        scanner = Cube3x3Scanner:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Edge3Seeker:_table_contains(tbl, x)
    found = false
    for _, v in pairs(tbl) do
        if v == x then 
            found = true 
        end
    end
    return found
end

function Edge3Seeker:seekEdge(cube, possibilities)
    local targetedOrients = ""
    local targetedColors = ""
    local edges = self.scanner:scanEdges(cube)
    for k,v in pairs(edges) do
        if self:_table_contains(possibilities, v) then
            targetedOrients = k
            targetedColors = v
            break
        end
    end
    return targetedOrients.."__"..targetedColors   
end
