-- gigaminx rotate utils
-- @author: LucaGoubelle

GigaminxRotateUtils = {}

function GigaminxRotateUtils:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function GigaminxRotateUtils:genEmptyFace()
    local face = {}
    local ring1 = {}
    local ring2 = {}
    local ring3 = {}
    for i=1,20 do
        table.insert(ring1, "")
    end
    for i=1,10 do
        table.insert(ring2, "")
    end
    table.insert(ring3, "")
    -- merge elements
    table.insert(face, ring1)
    table.insert(face, ring2)
    table.insert(face, ring3)
    return face
end

function MasterKilominxRotateUtils:copyFace(face)
    local new_face = {}
    local new_ring1 = {}
    local new_ring2 = {}
    local new_ring3 = {}
    for i=1,20 do
        table.insert(new_ring1, face[1][i])
    end
    for i=1,10 do
        table.insert(new_ring2, face[2][i])
    end
    table.insert( new_ring3, face[3][1] )
    -- merge data
    table.insert(new_face, new_ring1)
    table.insert(new_face, new_ring2)
    table.insert(new_face, new_ring3)
    return new_face
end

function GigaminxRotateUtils:rotate(face)
    local new_face = self:genEmptyFace()
    
    new_face[1][1] = face[1][17]
    new_face[1][2] = face[1][18]
    new_face[1][3] = face[1][19]
    new_face[1][4] = face[1][20]
    new_face[1][5] = face[1][1]
    new_face[1][6] = face[1][2]
    new_face[1][7] = face[1][3]
    new_face[1][8] = face[1][4]
    new_face[1][9] = face[1][5]
    new_face[1][10] = face[1][6]

    new_face[1][11] = face[1][7]
    new_face[1][12] = face[1][8]
    new_face[1][13] = face[1][9]
    new_face[1][14] = face[1][10]
    new_face[1][15] = face[1][11]
    new_face[1][16] = face[1][12]
    new_face[1][17] = face[1][13]
    new_face[1][18] = face[1][14]
    new_face[1][19] = face[1][15]
    new_face[1][20] = face[1][16]

    new_face[2][1] = face[1][9]
    new_face[2][2] = face[1][10]
    new_face[2][3] = face[1][1]
    new_face[2][4] = face[1][2]
    new_face[2][5] = face[1][3]
    new_face[2][6] = face[1][4]
    new_face[2][7] = face[1][5]
    new_face[2][8] = face[1][6]
    new_face[2][9] = face[1][7]
    new_face[2][10] = face[1][8]

    new_face[3][1] = face[3][1]

    return new_face
end

function GigaminxRotateUtils:rotate_async(face)
    local new_face = self:genEmptyFace()
    
    new_face[1][1] = face[1][5]
    new_face[1][2] = face[1][6]
    new_face[1][3] = face[1][7]
    new_face[1][4] = face[1][8]
    new_face[1][5] = face[1][9]
    new_face[1][6] = face[1][10]
    new_face[1][7] = face[1][11]
    new_face[1][8] = face[1][12]
    new_face[1][9] = face[1][13]
    new_face[1][10] = face[1][14]

    new_face[1][11] = face[1][15]
    new_face[1][12] = face[1][16]
    new_face[1][13] = face[1][17]
    new_face[1][14] = face[1][18]
    new_face[1][15] = face[1][19]
    new_face[1][16] = face[1][20]
    new_face[1][17] = face[1][1]
    new_face[1][18] = face[1][2]
    new_face[1][19] = face[1][3]
    new_face[1][20] = face[1][4]

    new_face[2][1] = face[1][3]
    new_face[2][2] = face[1][4]
    new_face[2][3] = face[1][5]
    new_face[2][4] = face[1][6]
    new_face[2][5] = face[1][7]
    new_face[2][6] = face[1][8]
    new_face[2][7] = face[1][9]
    new_face[2][8] = face[1][10]
    new_face[2][9] = face[1][1]
    new_face[2][10] = face[1][2]

    new_face[3][1] = face[3][1]

    return new_face
end

function GigaminxRotateUtils:transfert(face, new_face)
    for i=1,20 do
        face[1][i] = (new_face[1][i]!="") and new_face[1][i] or face[1][i]
    end
    for i=1,10 do
        face[2][i] = (new_face[1][i]!="") and new_face[1][i] or face[1][i]
    end
    face[3][1] = (new_face[3][1]!="") and new_face[3][1] or face[3][1]
    return face
end
