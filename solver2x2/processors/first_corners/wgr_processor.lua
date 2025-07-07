require "solver_helpers.cube_algorithms"

local ca = CubeAlgorithms:new()

-- white green red processor
WGRProcessor={}

function WGRProcessor:new()
    local obj = {
        data = {
            up_front_right__white_green_red = "U' y "..ca.ELEVATOR.." y'",
            up_front_right__red_white_green = "U' R' U' R",
            up_front_right__green_red_white = "U2 R' U R",

            up_front_left__white_red_green = "U2 y "..ca.ELEVATOR.." y'",
            up_front_left__green_white_red = "R' U2 R",
            up_front_left__red_green_white = "U2 R' U' R",

            up_back_right__white_red_green = "y "..ca.ELEVATOR.." y'",
            up_back_right__green_white_red = "U' R' U R",
            up_back_right__red_green_white = "R' U' R",
            
            up_back_left__white_green_red = "U y "..ca.ELEVATOR.." y'",
            up_back_left__red_white_green = "U R' U' R",
            up_back_left__green_red_white = "R' U R",

            down_front_left__white_green_red = "L2 y R2 y'",
            down_front_left__green_red_white = "R D R'",
            down_front_left__red_white_green = "L2 U R' U' R",

            down_back_left__white_red_green = "L D L' D'",
            down_back_left__green_white_red = "L y' L2 y",
            down_back_left__red_green_white = "y' L y",
            
            down_back_right__red_white_green = "R' U R U' R' U R",
            down_back_right__green_red_white = "R' U' R U R' U' R"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function WGRProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
