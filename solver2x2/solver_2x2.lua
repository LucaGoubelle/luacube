require "solver2x2.handlers.start_handler"
require "solver2x2.handlers.first_corners_handler"
require "solver2x2.handlers.last_face_handler"
-- solver 2x2
-- @author: LucaGoubelle
Solver2x2={}

function Solver2x2:new()
    local obj = {
        startHandler = StartHandler:new(),
        firstCornersHandler = FirstCornersHandler:new(),
        lastFaceHandler = LastFaceHandler:new()
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Solver2x2:solve(cube)
    cube = self.startHandler:handle(cube)
    cube = self.firstCornersHandler:handle(cube)
    cube = self.lastFaceHandler:handle(cube)
    return cube
end
