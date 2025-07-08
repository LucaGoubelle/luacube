require "luacube.move.mover"
require "solver_helpers.seekers.corner_2_seeker"

require "solver2x2.processors.first_corners.wgr_processor"
require "solver2x2.processors.first_corners.wgo_processor"
require "solver2x2.processors.first_corners.wbo_processor"

-- first corner handler
FirstCornersHandler={}

function FirstCornersHandler:new()
    local obj = {
        mover = Mover:new(),
        seeker = Corner2Seeker:new(),
        -- processors
        wgrProc = WGRProcessor:new(),
        wgoProc = WGOProcessor:new(),
        wboProc = WBOProcessor:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function FirstCornersHandler:handleWGR(cube)
    local corner = self.seeker:seekCorner(cube, {
        "white_green_red","white_red_green",
        "green_white_red","green_red_white",
        "red_white_green","red_green_white"
    })
    local sequence = self.wgrProc:process(corner)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function FirstCornersHandler:handleWGO(cube)
    local corner = self.seeker:seekCorner(cube, {
        "white_green_orange","white_orange_green",
        "green_white_orange","green_orange_white",
        "orange_white_green","orange_green_white"
    })
    local sequence = self.wgoProc:process(corner)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function FirstCornersHandler:handleWBO(cube)
    local corner = self.seeker:seekCorner(cube, {
        "white_blue_orange","white_orange_blue",
        "blue_white_orange","blue_orange_white",
        "orange_white_blue","orange_blue_white"
    })
    local sequence = self.wboProc:process(corner)
    cube = self.mover:multiMoves(cube, sequence)
    return cube
end

function FirstCornersHandler:handle(cube)
    cube = self:handleWGR(cube)
    cube = self:handleWGO(cube)
    cube = self:handleWBO(cube)
    return cube
end
