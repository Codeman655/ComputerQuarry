path=shell.resolveProgram("_move")
if path==nil or not os.loadAPI(path) then
  print ("Can\'t load library: _move")
  return 1
end

path=shell.resolveProgram("_dig")
if path==nil or not os.loadAPI(path) then
  print ("Can\'t load library: _dig")
  return 1
end

--Set Coordinates
--io.open("/coord")

--my_x, my_y, my_z=-1068,8,928
--orientation=1

--movement.moveForward(1)
--movement.moveBack(1)
