-- center processor
CenterProcessor={}

function CenterProcessor:new()
    local obj = {
        data = {
            white_blue="z2",
            white_green="x2",
            yellow_green="y2"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CenterProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
