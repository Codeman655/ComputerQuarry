local function dump()
  for i=1,9 do
    turtle.select(i)
    turtle.drop()
  end
  turtle.select(1)
end

path=shell.resolveProgram("_move")
if path==nil or not os.loadAPI(path) then
  print ("Can\'t load library: _move")
  return 1
end

print("Which quarry:")
num=io.read()

minedone=false
area=2

while not minedone do
_move.moveUp(5)
_move.moveForward((area*(num-1))+10)
_move.descend()
retval = shell.run("excavate", area)
--exit case
if turtle.getItemCount(1) == 0 or retval == false then
  minedone=true
end

--go home
turtle.turnRight()
turtle.turnRight()
_move.moveUp(5)
_move.moveForward((area*(num-1))+10)
_move.descend()
turtle.turnRight()
turtle.turnRight()
dump()
end
print("finished")
