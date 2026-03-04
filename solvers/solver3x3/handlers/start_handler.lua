require "solvers.solver3x3.processors.center_processor"
require "solvers.solver3x3.handlers.handler"
require "solver_helpers.scanners.cube_3x3_scanner"
-- start handler
StartHandler = setmetatable({}, {__index = Handler})
StartHandler.__index = StartHandler

function StartHandler:new()
    local obj = setmetatable(Handler:new(), self)
    obj.proc = CenterProcessor:new()
    obj.scanner = Cube3x3Scanner:new()
    return obj
end

function StartHandler:handle(cube)
    local inputData = self.scanner:scanCenter(cube, "up").."_"..self.scanner:scanCenter(cube, "front")
    local sequence = self.proc:process(inputData)
    cube = self.mover:mutliMoves(cube, sequence)
    return cube
end
