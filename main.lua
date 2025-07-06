-- entry point
require "luacube.all"

local builder = CubeBuilder:new()
local printer = CubePrinter:new()
local mover = Mover:new()

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
    if mv == "exit"
    then
        break
    end

    print("\n-------------------------------------------------\n\n")
end
