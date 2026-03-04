-- require "luacube.move.mover"
require "solver_helpers.advanced.oll_scanner"
require "solver_helpers.advanced.pll_scanner"

require "solvers.solver2x2.handlers.handler"
require "solvers.solver2x2.processors.last_face.oll_processor"
require "solvers.solver2x2.processors.last_face.pll_processor"

-- last face handler extends Handler
LastFaceHandler= setmetatable({}, {__index = Handler})
LastFaceHandler.__index = LastFaceHandler

function LastFaceHandler:new()
    local obj = setmetatable(Handler:new(), self)
    obj.ollScanner = OLLScanner:new()
    obj.pllScanner = PLLScanner:new()
    obj.ollProc = OLLProcessor:new()
    obj.pllProc = PLLProcessor:new()
    return obj
end

function LastFaceHandler:handleOLL(cube)
    local ollConfig = self.ollScanner:scanOLL(cube)
    local sequence = self.ollProc:process(ollConfig)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function LastFaceHandler:handlePLL(cube)
    local pllConfig = self.pllScanner:scanPLL(cube)
    local sequence = self.pllProc:process(pllConfig)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function LastFaceHandler:handleAUF(cube)
    local color = cube.front[1][1]
    local hmap = {
        red = "U'",
        orange = "U",
        green = "U2"
    }
    cube = self.mover:multiMoves(cube, hmap[color] or "???")
    return cube
end

function LastFaceHandler:handle(cube)
    cube = self:handleOLL(cube)
    cube = self:handlePLL(cube)
    cube = self:handleAUF(cube)
    return cube
end
