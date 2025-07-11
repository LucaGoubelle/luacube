-- center processor
CenterProcessor={}

function CenterProcessor:new()
    local obj = {
        data = {}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function CenterProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
