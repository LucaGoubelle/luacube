require "solver_helpers.cube_algorithms"
require "solvers.solver2x2.processors.processor"

local ca = CubeAlgorithms:new()

-- PLLs processor
PLLProcessor=setmetatable({}, {__index=Processor})
PLLProcessor.__index = PLLProcessor

function PLLProcessor:new()
    local obj = setmetatable(Processor:new(), self)
    obj.data={
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
    return obj
end
