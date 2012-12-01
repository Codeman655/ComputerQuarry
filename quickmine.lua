path=shell.resolveProgram("_gmove")
if path==nil or not os.loadAPI(path) then
  print ("Can\'t load library: _movement")
  return 1
end

--save starting coordinate
gps.locate()
coord=_move.readCoord()
home_x, home_y, home_z, orientation = coord[1],coord[2],coord[3],coord[4]

dest_x=arg[1]
dest_z=arg[2]

_gmove.goto(dest_x, dest_z)
shell.run("excavate", area)
_gmove.goto(home_x, home_z)
_gmove.faceNorth()
for i=1,9 do
  turtle.select(i)
  turtle.drop()
end
print("finished")
