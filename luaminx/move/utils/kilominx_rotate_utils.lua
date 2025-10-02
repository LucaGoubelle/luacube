-- kilominx rotate utils
-- @author: LucaGoubelle

KilominxRotateUtils = {}

function KilominxRotateUtils:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function KilominxRotateUtils:genEmptyFace()
    local face = {}
    for i=1,5 do
        table.insert(face, "")
    end
    return face
end

function KilominxRotateUtils:copyFace(face)
    local new_face = {}
    for i=1,5 do
        table.insert(new_face, face[i])
    end
    return new_face
end

function KilominxRotateUtils:rotate(face)
    local new_face = self:genEmptyFace()
    new_face[1] = face[5]
    new_face[2] = face[1]
    new_face[3] = face[2]
    new_face[4] = face[3]
    new_face[5] = face[4]
    return new_face
end

function KilominxRotateUtils:rotate_async(face)
    local new_face = self:genEmptyFace()
    new_face[1] = face[2]
    new_face[2] = face[3]
    new_face[3] = face[4]
    new_face[4] = face[5]
    new_face[5] = face[1]
    return new_face
end

function KilominxRotateUtils:transfert(face, new_face)
    for i=1,#face do
        face[i] = (new_face[i]!="") and new_face[i] or face[i]
    end
    return face
end
