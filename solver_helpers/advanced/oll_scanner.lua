require "solver_helpers.crown_scanner"
require "solver_helpers.crown_caster"
-- oll scanner
-- @author: LucaGoubelle
OLLScanner={}

function OLLScanner:new()
    local obj = {
        crownScanner = CrownScanner:new(),
        crownCaster = CrownCaster:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function OLLScanner:scanOLL(cube)
    local crown = self.crownScanner:scanCrown(cube)
    local result = self.crownCaster:cast(crown)
    return result
end
