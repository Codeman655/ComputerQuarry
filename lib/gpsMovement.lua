--TODO
--Rewrite move functions to have default (1) value
--Modify an external coordinate file
--Get to use global orientation

--Set Coordinates
orientations={"north","east","south","west"}
xDiff={0, 1, 0 ,-1}
zDiff={-1, 0, 1, 0}
timeout=5

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
  local x,z,y = gps.locate(timeout)
  print('X='..x..' Y='..y..' Z='..z)
end

function spinRight(orientation)
  print("orientation: "..orientation)
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
end

--Zoolander Functions :0
function faceNorth(orientation)
 while orientation~=1 do
	  orientation=spinRight(orientation)
 end
  return(orientation)
end
function faceEast(orientation) 
 while orientation~=2 do
	  orientation=spinRight(orientation)
 end
  return(orientation)
end
function faceSouth(orientation) 
 while orientation~=3 do
	  orientation=spinRight(orientation)
 end
  return(orientation)
end
function faceWest(orientation) 
 while orientation~=4 do
	  ret=spinRight(orientation)
 end
  return(orientation)
end

function moveForward(num)
  moved = false
  for i=1,num do
  if turtle.detect() == true then
	turtle.dig()
  end
    moved = turtle.forward()
	if moved == false then
		  i = i-1
    end
  end
end

function moveBack(num)
  coord = readCoord()
  moved = false
   for i=1,num do
    moved = turtle.back()
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
    end
  end
end

function descend()
  while not turtle.detectDown() do
    turtle.down()
  end
end

function goto(dest_x, dest_z, orientation)
  my_x,my_z,my_y = gps.locate(timeout)

  --Fly into the sky
  moveUp(5)

  print(dest_x)
  print(dest_z)
  print(orientation)
  print(my_x)
  print(my_z)

  --Determine X destination
  if dest_x > my_x then 
    orientation=faceEast(orientation)
	moveForward(dest_x - my_x)
  elseif my_x > dest_x then 
    orientation=faceWest(orientation)
	moveForward(my_x - dest_x)
  end

    --Determine Z destination
  if dest_z > my_z then 
    orientation=faceSouth(orientation)
	moveForward(dest_z - my_z)
  elseif my_z > dest_z then
    orientation=faceNorth(orientation)
	moveForward(my_z - dest_z)
  end
  descend()
  faceNorth(orientation)
end
