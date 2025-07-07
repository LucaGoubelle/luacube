-- white blue red corner processor
WBRProcessor={}

function WBRProcessor:new()
    local obj = {
        data={
            up_front_right__white_red_blue = "U' R2",
            up_front_right__blue_white_red = "R'",
            up_front_right__red_blue_white = "F",

            up_front_left__white_blue_red = "F2",
            up_front_left__red_white_blue = "U' F",
            up_front_left__blue_red_white = "U' R'",

            up_back_right__white_blue_red = "R2",
            up_back_right__red_white_blue = "U F",
            up_back_right__blue_red_white = "U R'",

            up_back_left__white_red_blue = "U R2",
            up_back_left__blue_white_red = "U2 R'",
            up_back_left__red_blue_white = "U2 F",


            down_front_left__white_red_blue = "D",
            down_front_left__blue_white_red = "L D2",
            down_front_left__red_blue_white = "F'",

            down_back_left__white_blue_red = "D2",
            down_back_left__red_white_blue = "L' D",
            down_back_left__blue_red_white = "L' F'",

            down_back_right__white_red_blue = "D'",
            down_back_right__blue_white_red = "R",
            down_back_right__red_blue_white = "R2 F",
            
            down_front_right__red_white_blue = "R' D'",
            down_front_right__blue_red_white = "F D"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function WBRProcessor:process(inputData)
    local result = data[inputData] or "???"
    return result
end
