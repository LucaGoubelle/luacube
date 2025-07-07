require "solver_helpers.scanners.cube_2x2_scanner"
require "solver_helpers.seekers.corner_2_seeker"
require "solver2x2.processors.first_corners.wbr_processor"
require "luacube.move.mover"
-- start handler
StartHandler={}

function StartHandler:new()
    local obj = {
        scanner = Cube2x2Scanner:new(),
        seeker = Corner2Seeker:new(),
        wbrProcessor = WBRProcessor:new(),
        mover = Mover:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function StartHandler:_handleFirstCorner(cube)
    local cornerInfo = self.seeker:seekCorner(cube, {
        "white_blue_red", "white_red_blue",
        "blue_white_red", "blue_red_white",
        "red_white_blue", "red_blue_white"
    })
    local sequence = self.wbrProcessor:process(cornerInfo)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function StartHandler:handle(cube)
    local corner = self.scanner:scanCorner(cube, "down_front_right")
    if corner == "white_blue_red" then return cube end -- nothing to do
    return self:_handleFirstCorner(cube)
end

