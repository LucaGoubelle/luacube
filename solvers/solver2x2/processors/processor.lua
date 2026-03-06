-- processor table
-- author: LucaGoubelle

Processor={}

function Processor:new()
    local obj = {
        data = {}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Processor:process(inputData)
    local result = self.data[inputData] or "???"
    return result
end
