require "solver_helpers.cube_algorithms"

local ca = CubeAlgorithms:new()

-- white blue red corner processor
WBOProcessor={}

function WBOProcessor:new()
    local obj = {
        data = {
            up_front_right__white_blue_orange = "L' U2 L U' L' U L",
            up_front_right__orange_white_blue = "U L' U' L",
            up_front_right__blue_orange_white = "L' U L",
            
            up_front_left__white_orange_blue = "y' "..ca.ELEVATOR.." y",
            up_front_left__blue_white_orange = "U' L' U L",
            up_front_left__orange_blue_white = "L' U' L",

            up_back_left__white_blue_orange = "U' y' "..ca.ELEVATOR.." y",
            up_back_left__orange_white_blue = "U' L' U' L",
            up_back_left__blue_orange_white = "U2 L' U L",
            
            up_back_right__white_orange_blue = "U2 y' "..ca.ELEVATOR.." y",
            up_back_right__blue_white_orange = "L' U2 L",
            up_back_right__orange_blue_white = "U2 L' U' L",

            down_front_left__orange_white_blue = "L' U L U' L' U L",
            down_front_left__blue_orange_white = "L' U' L U L' U' L"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function WBOProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
