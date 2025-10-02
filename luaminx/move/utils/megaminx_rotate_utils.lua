-- megaminx rotate utils
-- @author: LucaGoubelle

MegaminxRotateUtils = {}

function MegaminxRotateUtils:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MegaminxRotateUtils:genEmptyFace()
    local face = {}
    local ring1 = {}
    local ring2 = {}
    for i=1,10 do
        table.insert(ring1, "")
    end
    table.insert(ring2, "")
    -- merge elements
    table.insert(face, ring1)
    table.insert(face, ring2)
    return face
end

function MegaminxRotateUtils:rotate(face)
    local new_face = self:genEmptyFace()

    new_face[1][1] = face[1][9]
    new_face[1][2] = face[1][10]
    new_face[1][3] = face[1][1]
    new_face[1][4] = face[1][2]
    new_face[1][5] = face[1][3]
    new_face[1][6] = face[1][4]
    new_face[1][7] = face[1][5]
    new_face[1][8] = face[1][6]
    new_face[1][9] = face[1][7]
    new_face[1][10] = face[1][8]

    new_face[2][1] = face[2][1]

    return new_face
end

function MegaminxRotateUtils:rotate_async(face)
    local new_face = self:genEmptyFace()
    
    new_face[1][1] = face[1][3]
    new_face[1][2] = face[1][4]
    new_face[1][3] = face[1][5]
    new_face[1][4] = face[1][6]
    new_face[1][5] = face[1][7]
    new_face[1][6] = face[1][8]
    new_face[1][7] = face[1][9]
    new_face[1][8] = face[1][10]
    new_face[1][9] = face[1][1]
    new_face[1][10] = face[1][2]

    new_face[2][1] = face[2][1]

    return new_face
end

function MegaminxRotateUtils:transfert(face, new_face)
    for i=1,10 do
        face[1][i] = (new_face[1][i]!="") and new_face[1][i] or face[1][i]
    end
    face[2][1] = (new_face[2][1]!="") and new_face[2][1] or face[2][1]
    return face
end
