require "solvers.solver2x2.processors.processor"
-- white green orange corner processor

WGOProcessor=setmetatable({}, {__index=Processor})
WGOProcessor.__index = WGOProcessor

function WGOProcessor:new()
    local obj = setmetatable(Processor:new(), self)
    obj.data = {
        up_front_left__white_green_orange = "L2",
        up_front_left__orange_white_green = "U L U L'",
        up_front_left__green_orange_white = "U L'",

        up_front_right__white_orange_green = "U L2",
        up_front_right__green_white_orange = "U2 L'",
        up_front_right__orange_green_white = "U2 L U L'",
        
        up_back_right__white_green_orange = "U2 L2",
        up_back_right__orange_white_green = "U' L U L'",
        up_back_right__green_orange_white = "U' L'",
        
        up_back_left__white_orange_green = "U' L2",
        up_back_right__green_white_orange = "L'",
        up_back_right__orange_green_white = "L U L'",

        down_front_left__white_orange_green = "L2 U' L2",
        down_front_left__green_white_orange = "L",
        down_front_left__orange_green_white = "L' U L'",

        down_back_left__orange_white_green = "L U' L2",
        down_back_left__green_orange_white = "L2 U L'"
    }
    return obj
end
