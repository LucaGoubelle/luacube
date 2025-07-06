-- entry point
require "luacube.all"

local builder = CubeBuilder:new()
local mover = Mover:new()
local scrambler = CubeScrambler:new()
local printer = CubePrinter:new()

local sizeCube = 3
local cube = builder:build(sizeCube)

while true do
    -- printing the cube
    printer:print(cube)

    -- user input
    print("ENTER A MOVE OR CMD :")
    local mv = io.read()

    -- move handle
    cube = mover:simpleMove(cube, mv)

    -- CMD handle
    if mv == "exit" then break
    elseif mv =="scramble" then cube = scrambler:scramble(cube)
    elseif mv == "init" then cube = builder:build(sizeCube)
    else print("Unknown command / move...") end

    print("\n-------------------------------------------------\n\n")
end
