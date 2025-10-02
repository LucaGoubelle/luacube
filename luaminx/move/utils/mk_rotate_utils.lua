-- master kilominx rotate utils
-- @author: LucaGoubelle

MasterKilominxRotateUtils = {}

function MasterKilominxRotateUtils:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MasterKilominxRotateUtils:genEmptyFace()
    local face = {}
    local ring1 = {}
    local ring2 = {}
    for i=1,15 do
        table.insert(ring1, "")
    end
    for i=1,5 do
        table.insert(ring2, "")
    end
    -- merge elements
    table.insert(face, ring1)
    table.insert(face, ring2)
    return face
end

function MasterKilominxRotateUtils:rotate(face)
    local new_face = self:genEmptyFace()
    
    new_face[1][1] = face[1][13]
    new_face[1][2] = face[1][14]
    new_face[1][3] = face[1][15]
    new_face[1][4] = face[1][1]
    new_face[1][5] = face[1][2]
    
    new_face[1][6] = face[1][3]
    new_face[1][7] = face[1][4]
    new_face[1][8] = face[1][5]
    new_face[1][9] = face[1][6]
    new_face[1][10] = face[1][7]

    new_face[1][11] = face[1][8]
    new_face[1][12] = face[1][9]
    new_face[1][13] = face[1][10]
    new_face[1][14] = face[1][11]
    new_face[1][15] = face[1][12]

    new_face[2][1] = face[2][5]
    new_face[2][1] = face[2][1]
    new_face[2][1] = face[2][2]
    new_face[2][1] = face[2][3]
    new_face[2][1] = face[2][4]

    return new_face
end

function MasterKilominxRotateUtils:rotate_async(face)
    local new_face = self:genEmptyFace()
    
    new_face[1][1] = face[1][4]
    new_face[1][2] = face[1][5]
    new_face[1][3] = face[1][6]
    new_face[1][4] = face[1][7]
    new_face[1][5] = face[1][8]
    
    new_face[1][6] = face[1][9]
    new_face[1][7] = face[1][10]
    new_face[1][8] = face[1][11]
    new_face[1][9] = face[1][12]
    new_face[1][10] = face[1][13]

    new_face[1][11] = face[1][14]
    new_face[1][12] = face[1][15]
    new_face[1][13] = face[1][1]
    new_face[1][14] = face[1][2]
    new_face[1][15] = face[1][3]

    new_face[2][1] = face[2][2]
    new_face[2][1] = face[2][3]
    new_face[2][1] = face[2][4]
    new_face[2][1] = face[2][5]
    new_face[2][1] = face[2][1]

    return new_face
end

function MasterKilominxRotateUtils:transfert(face, new_face)
    for i=1,15 do
        face[1][i] = (new_face[1][i]!="") and new_face[1][i] or face[1][i]
    end
    for i=1,5 do
        face[2][i] = (new_face[2][i]!="") and new_face[2][i] or face[2][i]
    end
    return face
end
