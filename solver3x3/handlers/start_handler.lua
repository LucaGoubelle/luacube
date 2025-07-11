require "solver3x3.processors.center_processor"
require "solver_helpers.scanners.cube_3x3_scanner"
require "luacube.move.mover"
-- start handler
StartHandler = {}

function StartHandler:new()
    local obj = {
        proc = CenterProcessor:new()
        mover = Mover:new()
        scanner = Cube3x3Scanner:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function StartHandler:handle(cube)
    local inputData = self.scanner:scanCenter(cube, "up").."_"..self.scanner:scanCenter(cube, "front")
    local sequence = self.proc:process(inputData)
    cube = self.mover:mutliMoves(cube, sequence)
    return cube
end
