require "luacube.display.ansi_colors"

local ansiColors = ANSIColors:new()

-- cube printer
-- print cube instance in console
-- @author: LucaGoubelle
CubePrinter={}

function CubePrinter:new()
    local obj = {
        hmapColors = {
            green=ansiColors.bg_green.." "..ansiColors.reset,
            yellow=ansiColors.bg_yellow.." "..ansiColors.reset,
            blue=ansiColors.bg_blue.." "..ansiColors.reset,
            orange=ansiColors.bg_purple.." "..ansiColors.reset,
            red=ansiColors.bg_red.." "..ansiColors.reset,
            white=ansiColors.bg_white.." "..ansiColors.reset
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-------------------------------
-- logic here
-------------------------------

function CubePrinter:_printRowUpDown(row)
    local content = ""
    for i = 1,#row do
        content = content.." "
    end
    for _,elem in pairs(row) do
        content = content..self.hmapColors[elem]
    end
    content = content.."\n"
    return content
end

function CubePrinter:_printRowLFRB(rowL, rowF, rowR, rowB)
    local content = ""
    for _,elem in pairs(rowL) do
        content = content..self.hmapColors[elem]
    end
    for _,elem in pairs(rowF) do
        content = content..self.hmapColors[elem]
    end
    for _,elem in pairs(rowR) do
        content = content..self.hmapColors[elem]
    end
    for _,elem in pairs(rowB) do
        content = content..self.hmapColors[elem]
    end
    content = content.."\n"
    return content
end

----------------------------
-- callables methods here --
----------------------------

function CubePrinter:print(cube)
    local content = ""
    local size = #cube.front
    for _,row in pairs(cube.up) do
        content = content..self:_printRowUpDown(row)
    end
    for i = 1,size do
        local rowL = cube.left[i]
        local rowF = cube.front[i]
        local rowR = cube.right[i]
        local rowB = cube.back[i]
        content = content..self:_printRowLFRB(rowL, rowF, rowR, rowB)
    end
    for _,row in pairs(cube.down) do
        content = content..self:_printRowUpDown(row)
    end
    print(content)
end
