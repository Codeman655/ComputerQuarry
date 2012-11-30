function readCoord()
  x,y,z = 0,0,0
  a={}
  orientation=1
  F=io.open('/coord')
  if F == nil then
    print("/coord file does not exist")
    return(1)
  end

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
  F:write(A[1].."\n")
  F:write(A[2].."\n")
  F:write(A[3].."\n")
  F:write(A[4].."\n")
  F:close()
end

  a=readCoord()
  print(a[1])
  print(a[2])
  print(a[3])
  print(a[4])

  a[1] = a[1] + 1
  writeCoord(a)
