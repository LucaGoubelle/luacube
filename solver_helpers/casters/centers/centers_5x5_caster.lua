-- centers 5x5 caster
-- @author: LucaGoubelle
require "solver_helpers.casters.centers.centers_caster"

Centers5x5Caster={}

function Centers5x5Caster:new()
    local obj = {
        size = 5
    }
    setmetatable(obj, CentersCaster)
    self.__index = self
    return obj
end

function Centers5x5Caster:_extractCenters(actualFace)
    local centers = {
        {actualFace[2][2], actualFace[2][3], actualFace[2][4]},
        {actualFace[3][2], actualFace[3][3], actualFace[3][4]},
        {actualFace[4][2], actualFace[4][3], actualFace[4][4]}
    }
    return centers
end
