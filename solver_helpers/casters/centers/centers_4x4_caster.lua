-- centers 4x4 caster
-- @author: LucaGoubelle
require "solver_helpers.casters.centers.centers_caster"

Centers4x4Caster={}

function Centers4x4Caster:new()
    local obj = {
        size = 4
    }
    setmetatable(obj, CentersCaster)
    self.__index = self
    return obj
end

function Centers4x4Caster:_extractCenters(actualFace)
    local centers = {
        {actualFace[2][2], actualFace[2][3]},
        {actualFace[3][2], actualFace[3][3]}
    }
    return centers
end
