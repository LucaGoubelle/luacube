-- minx instance
-- @author: LucaGoubelle

Minx = {}

function Minx:new(up, front, left, right, downleft, downright, absleft, absright, backleft, backright, back, down)
    local obj = {
        up=up,
        front=front,
        left=left,
        right=right,
        downleft=downleft,
        downright=downright,
        absleft=absleft,
        absright=absright,
        backleft=backleft,
        backright=backright,
        back=back,
        down=down
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
