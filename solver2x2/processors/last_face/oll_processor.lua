-- OLLs processor
OLLProcessor={}

function OLLProcessor:new()
    local obj = {
        data={}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function OLLProcessor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
