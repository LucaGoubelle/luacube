require "solver_helpers.cube_algorithms"

local ca = CubeAlgorithms:new()

-- PLLs processor
PLLProcessor={}

function PLLProcessor:new()
    local obj = {
        data={
            -- T cases
            BR_GB_RG_OO = ca.T_PERM,
            RG_0R_GO_BB = ca.T_PERM,
            GO_BG_OB_RR = ca.T_PERM,
            OB_RO_BR_GG = ca.T_PERM,

            -- Y cases
            BG_OR_GB_RO = ca.Y_PERM,
            GB_RO_BG_OR = ca.Y_PERM,
            RO_BG_OR_GB = ca.Y_PERM
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PLLProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
