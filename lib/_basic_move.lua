--TODO
--Rewrite move functions to have default (1) value

--Set Coordinates
my_x, my_y, my_z=0,0,0
orientation=1
orientations={"north","east","south","west"}
xDiff={0, 1, 0 ,-1}
zDiff={-1, 0, 1, 0}

function whereami()
  print ( "X="..my_x.." Y="..my_y.." Z="..my_z )
  print ( "Facing "..orientations[orientation])
  print ('')
end

function spinRight()
  orientation = orientation - 1
  orientation = (orientation + 1) % 4
  orientation = orientation + 1
  turtle.turnRight()
  whereami()
end

function spinLeft()
  orientation = orientation - 1
  orientation = (orientation - 1) % 4
  orientation = orientation + 1
  turtle.turnLeft()
  whereami()
end

--Zoolander Functions :0
function faceNorth()
 while orientation~=1 do
	  spinRight()
 end
end
function faceEast() 
 while orientation~=2 do
	  spinRight()
 end
end
function faceSouth() 
 while orientation~=3 do
	  spinRight()
 end
end
function faceWest() 
 while orientation~=4 do
	  spinRight()
 end
end

function moveForward(num)
  moved = false
  for i=1,num do
  if turtle.detect() == true then
	turtle.dig()
  end
    moved = turtle.forward()
	if moved == false then
		  i = i -1
    else
      my_x = my_x + xDiff[orientation]
      my_z = my_z + zDiff[orientation]
      whereami()
    end
  end
end

function moveBack(num)
  moved = false
   for i=1,num do
    moved = turtle.back()
    my_x = my_x + (xDiff[orientation] * -1)
    my_z = my_z + (zDiff[orientation] * -1)
    whereami()
  end
end

function moveUp(num)
  moved = false
  for i=1,num do
    if turtle.detectUp() == true then
	  turtle.digUp()
	end
    moved = turtle.up()
    if moved == false then
      i = i -1
    else
      my_y = my_y + 1
      whereami()
    end
  end
end

function moveDown(num)
  moved = false
  for i=1,num do
    if turtle.detectDown() == true then
      turtle.digDown()
    end
    moved = turtle.down()
    if moved == false then
      i = i -1
    else
      my_y = my_y - 1
      whereami()
    end
  end
end

function decend()
  while not turtle.detect() do
    turtle.down()
  end
end

function goto(dest_x, dest_z)
  --Fly into the sky
  moveUp(10)
  --Determine X destination
  if dest_x > my_x then 
    faceEast()
	moveForward(dest_x - my_x)
  else
    faceWest()
	moveForward(my_x - dest_x)
  end
  
    --Determine Z destination
  if dest_z > my_z then 
    faceSouth()
	moveForward(dest_z - my_z)
  else
    faceNorth()
	moveForward(my_z - dest_z)
  end
  decend()
end


--Place scripts here to test
