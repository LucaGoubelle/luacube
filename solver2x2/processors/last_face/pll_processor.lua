require "solver_helpers.cube_algorithms"

local ca = CubeAlgorithms:new()

-- PLLs processor
PLLProcessor={}

function PLLProcessor:new()
    local obj = {
        data={}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PLLProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
