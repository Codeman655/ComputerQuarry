if not turtle then
print("Error Not turtle")
return
end
if turtle.getFuelLevel() < 600 then
print("600 fuel is required")
return
else
print("Please Place 4 computers in slot one")
print("4 modems in slot two")
print("Disk drive in slot three")
print("and boot disk in slot four")
print("press Enter key to continue")
while true do
  local event , key = os.pullEvent("key")
  if key == 28 then break end
end
print("Launching")
end
local set = {}
set[1] = {x = 0,y = 3,z = 255}
set[2] = {x = 3,y = 0,z = 252}
set[3] = {x = 0,y = -3,z = 255}
set[4] = {x = -3,y = 0,z = 252}
while turtle.up() do
end
for a = 1,4 do
for i = 1,2 do
  turtle.forward()
end
turtle.select(1)
turtle.place()
turtle.back()
turtle.select(2)
turtle.place()
turtle.down()
turtle.forward()
turtle.select(3)
turtle.place()
turtle.select(4)
turtle.drop()
-- make disk cusrom
fs.delete("disk/startup")
file = fs.open("disk/startup","w")
file.write([[fs.copy("disk/install","startup")]])
file.close()
file = fs.open("disk/install","w")
file.write([[shell.run("gps","host",]]..set[a]["x"]..","..set[a]["y"]..","..set[a]["z"]..[[)]])
file.close()
-- end make disk custom
turtle.turnLeft()
turtle.forward()
turtle.up()
turtle.turnRight()
turtle.forward()
turtle.turnRight()
peripheral.call("front","turnOn")
turtle.down()
turtle.suck()
turtle.select(3)
turtle.dig()
turtle.up()
peripheral.call("front","reboot")
turtle.turnRight()
for i = 1,3 do
  turtle.forward()
end
turtle.turnLeft()
turtle.forward()
if a == 1 or a == 3 then
  for i = 1,3 do
  turtle.down()
  end
elseif a == 2 or a == 4 then
  for i = 1,3 do
  turtle.up()
  end
end
end
while turtle.down() do
end
