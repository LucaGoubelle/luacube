-- PLL scanner
-- @author: LucaGoubelle
PLLScanner={}

function PLLScanner:new()
    local obj = {
        hmap = {
            blue="B",
            red="R",
            green="G",
            orange="O",
            white="W",
            yellow="Y"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PLLScanner:scanPLL(cube)
    local result = ""
    for _,elem in pairs(cube.front[1]) do
        result = result..self.hmap[elem]
    end
    result = result.."_"
    for _,elem in pairs(cube.right[1]) do
        result = result..self.hmap[elem]
    end
    result = result.."_"
    for _,elem in pairs(cube.back[1]) do
        result = result..self.hmap[elem]
    end
    result = result.."_"
    for _,elem in pairs(cube.left[1]) do
        result = result..self.hmap[elem]
    end
    return result
end
