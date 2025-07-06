-- ansi colors class
-- @author: LucaGoubelle

ANSIColors = {}

function ANSIColors:new()
    local obj = {
        bg_red = '\27[41m',
        bg_green = '\27[42m',
        bg_yellow = '\27[43m',
        bg_blue = '\27[44m',
        bg_purple = '\27[45m',
        bg_cyan = '\27[46m',
        bg_white = '\27[47m',
        reset = '\27[0m'
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

