-- entry point
require "luacube.all"
require "solver2x2.solver_2x2"

local builder = CubeBuilder:new()
local dumper = CubeDumper:new()
local strdumper = CubeStrDumper:new()
local mover = Mover:new()
local scrambler = CubeScrambler:new()
local printer = CubePrinter:new()
local solver = Solver2x2:new()

local sizeCube = 2
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
    elseif mv == "strdump" then print(strdumper:dump(cube)) -- dump a string color instance in console
    elseif mv == "solve" then cube = solver:solve(cube) -- solve the cube
    else print("Unknown command / move...") end

    print("\n-------------------------------------------------\n\n")
end
