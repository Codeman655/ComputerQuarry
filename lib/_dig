--digging library

function dump()
  for i=1,9 do
    turtle.select(i)
    turtle.drop()
  end
end

function digLine(num)
  for i=1,num do
    turtle.dig()
    turtle.forward()
  end
end

function digSquare(area)
  for i=1,area do
    for j=1,area do
      turtle.dig()
      turtle.forward()
    end

    if i%2 == 0 then
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
    else
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
    end
  end
end

function probe()
  shell.run(excavate, 1)
end
