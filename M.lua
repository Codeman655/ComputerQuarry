--TODO
--Rewrite move functions to have default (1) value

M = {} --externally facing modules

--Set Coordinates
M.my_x, M.my_y, M.my_z=0,0,0
local orientations={"north","east","south","west"}
local xDiff={0, 1, 0 ,-1}
local zDiff={-1, 0, 1, 0}

function M.whereami()
  print ( "X="..my_x.." Y="..my_y.." Z="..my_z )
  print ( "Facing "..orientations[orientation])
  print ('')
end

function M.spinRight()
  orientation = orientation - 1
  orientation = (orientation + 1) % 4
  orientation = orientation + 1
  turtle.turnRight()
  whereami()
end

function M.spinLeft()
  orientation = orientation - 1
  orientation = (orientation - 1) % 4
  orientation = orientation + 1
  turtle.turnLeft()
  whereami()
end

--Zoolander Functions :0
function M.faceNorth()
 while orientation~=1 do
	  M.spinRight()
 end
end
function M.faceEast() 
 while orientation~=2 do
	  M.spinRight()
 end
end
function M.faceSouth() 
 while orientation~=3 do
	  M.spinRight()
 end
end
function M.faceWest() 
 while orientation~=4 do
	  M.spinRight()
 end
end

function M.moveForward(num)
  moved = false
  for i=1,num do
  if turtle.detect() == true then
	turtle.dig()
  end
    moved = turtle.forward()
	if moved == false then
		  i = i -1
    else
      M.my_x = M.my_x + xDiff[orientation]
      M.my_z = M.my_z + zDiff[orientation]
      whereami()
    end
  end
end

function M.moveBack(num)
  moved = false
   for i=1,num do
    moved = turtle.back()
    M.my_x = M.my_x + (xDiff[orientation] * -1)
    M.my_z = M.my_z + (zDiff[orientation] * -1)
    whereami()
  end
end

function M.moveUp(num)
  moved = false
  for i=1,num do
    if turtle.detectUp() == true then
	  turtle.digUp()
	end
    moved = turtle.up()
    if moved == false then
      i = i -1
    else
      M.my_y = M.my_y + 1
      whereami()
    end
  end
end

function M.moveDown(num)
  moved = false
  for i=1,num do
    if turtle.detectDown() == true then
      turtle.digDown()
    end
    moved = turtle.down()
    if moved == false then
      i = i -1
    else
      M.my_y = M.my_y - 1
      whereami()
    end
  end
end

function M.decend()
  while not turtle.detect() do
    turtle.down()
  end
end

function M.goto(dest_x, dest_z)
  --Fly into the sky
  M.moveUp(10)
  --Determine X destination
  if dest_x > my_x then 
    M.faceEast()
	M.moveForward(dest_x - my_x)
  else
    M.faceWest()
	M.moveForward(my_x - dest_x)
  end
  
    --Determine Z destination
  if dest_z > my_z then 
    M.faceSouth()
	M.moveForward(dest_z - my_z)
  else
    M.faceNorth()
	M.moveForward(my_z - dest_z)
  end
  M.decend()
end

return M
