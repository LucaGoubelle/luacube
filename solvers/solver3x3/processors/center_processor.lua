-- center 
require "solvers.solver3x3.processors.processor"

CenterProcessor=setmetatable({}, {__index=Processor})
CenterProcessor.__index = CenterProcessor

function CenterProcessor:new()
    local obj = setmetatable(Processor:new(), self)
    obj.data = {
        white_blue="z2",
        white_green="x2",
        yellow_green="y2"
    }
    return obj
end
