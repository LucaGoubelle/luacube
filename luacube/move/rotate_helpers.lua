-- rotate helpers class
-- @author: LucaGoubelle

RotateHelpers = {}

function RotateHelpers:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function RotateHelpers:genEmptyFace(size)
    local face = {}
    for i = 1, size do
        local row = {}
        for j = 1, size do
            table.insert(row, "")
        end
        table.insert(face, row)
    end
    return face
end

function RotateHelpers:copyFace(face)
    local newFace = {}
    local size = #face
    for i = 1, size do
        local row = {}
        for j = 1, size do
            table.insert(row, face[i][j])
        end
        table.insert(newFace, row)
    end
    return newFace
end

function RotateHelpers:rotate(face)
    local size = #face
    local newFace = self:genEmptyFace(size)
    for i = 1, size do
        local cnt = size
        for j = 1, size do
            newFace[i][j] = face[cnt][i]
            cnt = cnt-1
        end
    end
    return newFace
end

function RotateHelpers:rotateAsync(face)
    local size = #face
    local newFace = self:genEmptyFace(size)
    local cnt = size
    for i = 1,size do
        for j = 1, size do
            newFace[i][j] = face[j][cnt]
        end
        cnt = cnt-1
    end
    return newFace
end

function RotateHelpers:rotateTwice(face)
    local newFace = self:rotate(face)
    rotatedFace = self:rotate(newFace)
    return rotatedFace
end

function RotateHelpers:transfert(face, newFace)
    local size = #face
    for i = 1, size do
        for j = 1, size do
            face[i][j] = (newFace[i][j] ~= "" and newFace[i][j] or face[i][j])
        end
    end
    return face
end
