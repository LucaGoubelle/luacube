-- entry point
require "luacube.all"

local builder = CubeBuilder:new()
local dumper = CubeDumper:new()
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
    elseif mv =="scramble" then cube = scrambler:scramble(cube) -- scramble the puzzle
    elseif mv == "init" then cube = builder:build(sizeCube) -- reinitialize the puzzle
    elseif mv == "dump" then print(dumper:dump(cube)) -- dump memory of cube in console
    else print("Unknown command / move...") end

    print("\n-------------------------------------------------\n\n")
end
