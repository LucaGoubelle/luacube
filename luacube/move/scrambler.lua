-- cube scrambler
-- @author: LucaGoubelle
CubeScrambler = {}

-------------------------------------------------
--------- CONSTRUCTOR ---------------------------
-------------------------------------------------

function CubeScrambler:new()
    local obj = {
        mover = Mover:new(),
        scrambles = {
            "U D2 R B2 F2 L2 B' U' D B U2 B U B R' L U' B' U2 F' R F' R L U2",
            "B' F2 D' F2 U2 F2 B U F' D B2 F' L' B' F L2 D L F R' F B' D' F B2",
            "R2 D2 L2 B' L2 R' U' F L' R2 D2 B2 F2 R2 F' B' U' L D' B L B R' U2 F2",
            "R' D' B2 F R' L' F2 B R L2 B' F' L2 R' D B' D2 L U R B2 L' D2 U2 F",
            "L2 D' L' B L2 R2 F' D U B2 F U' F2 R' D2 F R' D2 U2 B' L2 U L U R2"
        },
        bigScrambles = {
            "U' F2 U' Fw' U' Dw R F2 U B2 R' B Fw U L' Uw Lw Dw2 U Fw2 Lw Uw' F U' Bw' D Fw Lw2",
            "F Lw2 F' Uw' Fw B' Lw2 Fw Lw2 D Fw2 D' U' R U2 B' D' F' Rw Lw2 U Dw2 Bw' L' Fw L",
            "Fw' Lw' Uw' F' U' L F' Dw' B2 Rw D F2 Lw2 Dw U R L2 F2 U2 L' Fw' U2 F2 R Fw2"
        }
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end


---------------------------------------------------
------- LOGIC METHODS -----------------------------
---------------------------------------------------

function CubeScrambler:_beginRandom()
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
end

function CubeScrambler:_scrambleSimpleCube(cube)
    self:_beginRandom()
    local rd = math.random(1,#self.scrambles)
    local scrb = self.scrambles[rd]
    cube = self.mover:multiMoves(cube, scrb)
    return cube
end

function CubeScrambler:_scrambleBigCube(cube)
    self:_beginRandom()
    local rd = math.random(1,#self.bigScrambles)
    local scrb = self.bigScrambles[rd]
    cube = self.mover:multiMoves(cube, scrb)
    return cube
end


-------------------------------------------
----- CALLABLES METHODS  ------------------
-------------------------------------------

function CubeScrambler:scramble(cube)
    local size = #cube.up
    if size == 2 then cube = self:_scrambleSimpleCube(cube) 
    elseif size == 3 then cube = self:_scrambleSimpleCube(cube)
    elseif size == 4 then cube = self:_scrambleBigCube(cube)
    elseif size == 5 then cube = self:_scrambleBigCube(cube)
    else cube = cube end
    return cube
end
