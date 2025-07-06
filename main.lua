-- entry point
require "luacube.all"

local builder = CubeBuilder:new()
local printer = CubePrinter:new()
local cube = builder:build(3)

printer:print(cube)
