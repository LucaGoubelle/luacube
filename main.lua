-- entry point
require "luacube.all"

local builder = CubeBuilder:new()
local printer = CubePrinter:new()
local mover = Mover:new()
local cube = builder:build(3)

printer:print(cube)
cube = mover:simpleMove(cube, "U") -- do nothing for the moment...
printer:print(cube)
