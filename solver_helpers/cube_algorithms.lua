-- cube algs
-- @author: LucaGoubelle
CubeAlgorithms={}

function CubeAlgorithms:new()
    local obj = {
        -- basics
        SEXY_MOVES = "R U R' U'",
        ELEVATOR = "R U R' U' R U R' U' R U R' U'",
        THREE_MOVES = "R U R'",
        EDGE_CONTROL = "R' F R F'",
        LEFT_BELGIUM = "U' L' U L U F U' F'",
        RIGHT_BELGIUM = "U R U' R' U' F' U F",
        FRIENDS = "R U' L' U R' U' L U",
        
        -- OLLs
        SUNE_ORIENT = "R U R' U R U2 R'",
        ANTISUNE_ORIENT = "R U2 R' U' R U' R'",
        U_ORIENT = "R2 D R' U2 R D' R' U2 R'",
        T_ORIENT = "Rw U R' U' L' U R U' x'",
        L_ORIENT = "Lw' U R D' R' U' R D x'",
        H_ORIENT = "F R U R' U' R U R' U' R U R' U' F'",
        PI_ORIENT = "R U2 R2 U' R2 U' R2 U2 R",
        
        -- PLLs
        T_PERM = "R U R' U' R' F R2 U' R' U' R U R' F'",
        J_PERM = "R U R' F' R U R' U' R' F R2 U' R' U'",
        Y_PERM = "F R U' R' U' R U R' F' R U R' U' R' F R F'"
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
