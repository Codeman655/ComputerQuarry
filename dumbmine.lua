local function dump()
  for i=1,9 do
    turtle.select(i)
    turtle.drop()
  end
end

path=shell.resolveProgram("_move")
if path==nil or not os.loadAPI(path) then
  print ("Can\'t load library: _move")
  return 1
end

--save starting coordinate
print("Please give the the storage x, y, z, coord:")
area=10
home_x=io.read()
home_y=io.read()
home_z=io.read()
home_coord=io.read()

for i=1,10 do
  trutle.up()
end
for i=1,10 do
  trutle.moveForward()
end
_move.descend()
retval = shell.run("excavate", area)

--goto(home)
dump()

for i=1,9 do
  turtle.select(i)
  turtle.drop()
end
print("finished")
