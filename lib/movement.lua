--TODO
--Rewrite move functions to have default (1) value
--Modify an external coordinate file

--Set Coordinates
orientations={"north","east","south","west"}
xDiff={0, 1, 0 ,-1}
zDiff={-1, 0, 1, 0}


function readCoord()
  x,y,z = 0,0,0
  a={}
  orientation=1
  if not fs.exists('/coord') then 
    print("/coord file does not exist")
    return(1)
  end

  F=io.open('/coord')
  i=1
  for line in F:lines() do
    if i==1 then
      a[1]=line+0
    elseif i==2 then
      a[2]=line+0
    elseif i==3 then
      a[3]=line+0
    elseif i==4 then
      a[4] = line+0
    else
      print "File too large"
      return (1)
    end
    i = i+1
  end
  --return({x,y,z,orientation})
  F:close()
  return(a)
end

function writeCoord(A)
  shell.run("delete", "/coord")
  F=io.open("/coord", 'w')
  F:write(A[1])
  F:write(A[2])
  F:write(A[3])
  F:write(A[4])
  F:close()
end

function whereami()
  F=io.open('/coord')
  if F == nil then
    print("/coord file does not exist")
    return(1)
  end
  for line in F:lines() do
    print(line)
  end
  
--  if my_x ~= nil then
--    print ( "X="..my_x.." Y="..my_y.." Z="..my_z )
--    print ( "Facing "..orientations[orientation])
--    print ('')
--  end
end

function spinRight(orientation)
  orientation = orientation - 1
  orientation = (orientation + 1) % 4
  orientation = orientation + 1
  turtle.turnRight()
  return(orientation)
end

function spinLeft(orientation)
  orientation = orientation - 1
  orientation = (orientation - 1) % 4
  orientation = orientation + 1
  turtle.turnLeft()
  return(orientation)
  --writeCoord(coord)
  --whereami()
end

--Zoolander Functions :0
function faceNorth(orientation)
 while orientation~=1 do
	  orientation = spinRight(orientation)
 end
 return(orientation)
end
function faceEast(orientation) 
 while orientation~=2 do
	  orientation = spinRight(orientation)
 end
 return(orientation)
end
function faceSouth(orientation) 
 while orientation~=3 do
	  spinRight(orientation)
 end
 return(orientation)
end
function faceWest(orientation) 
 while orientation~=4 do
	  spinRight(orientation)
 end
 return(orientation)
end

function moveForward(num)
  --coord = readCoord()
  moved = false
  for i=1,num do
  if turtle.detect() == true then
	turtle.dig()
  end
    moved = turtle.forward()
	if moved == false then
		  i = i-1
    else
   --   coord[1] = coord[1] + xDiff[orientation]
   --  coord[3] = coord[3] + zDiff[orientation]
      --whereami()
    end
  end
  --writeCoord(coord)
end

function moveBack(num)
  --coord = readCoord()
  moved = false
   for i=1,num do
    moved = turtle.back()
   --   coord[1] = coord[1] + (xDiff[orientation] * -1)
   --   coord[3] = coord[3] + (zDiff[orientation] * -1)
    --whereami()
  end
  --writeCoord(coord)
end

function moveUp(num)
  --coord = readCoord()
  moved = false
  for i=1,num do
    if turtle.detectUp() == true then
	  turtle.digUp()
	end
    moved = turtle.up()
    if moved == false then
      i = i -1
    else
      --print("moved")
      --   coord[2] = coord[2] + 1
      --writeCoord(coord)
      --whereami()
    end
  end
end

function moveDown(num)
  --coord = readCoord()
  moved = false
  for i=1,num do
    if turtle.detectDown() == true then
      turtle.digDown()
    end
    moved = turtle.down()
    if moved == false then
      i = i -1
    else
      --coord[2] = coord[2] - 1
      --whereami()
    end
  end
  --writeCoord(coord)
end

function descend()
  while not turtle.detectDown() do
    turtle.down()
    --coord[2] = coord[2] - 1
  end
  print("laneded")
  --writeCoord(coord)
end

function goto(dest_x, dest_z)
  coord=readCoord()
  my_x, my_y, my_z, orientation = coord[1],coord[2],coord[3],coord[4]

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

--my_x, my_y, my_z=22,6,-421
--whereami()
--goto(39, -454)
