# https://www.hackerrank.com/challenges/strong-password/problem
# LANG SKILL, IMPLEMENTATION
# lehetne az occursin-t is hasznalni
let
  num = Set(collect("0123456789"))
  lo = Set(collect("abcdefghijklmnopqrstuvwxyz"))
  up = Set(collect("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
  spec = Set(collect(raw"!@#$%^&*()-+"))

  numI,loI,upI,specI=1,1,1,1
  n=parse(Int,readline())
  s=readline()
  for c in s
    while true
      if c in num numI=0; break end
      if c in lo loI=0; break end
      if c in up upI=0; break end
      if c in spec specI=0; break end
      break
    end
  end
  m=sum((numI,loI,upI,specI)) 
  # println("m=",m)
  n+=m
  if n<6 m+=(6-n) end
  println(m)
end

# ez inkább stringesebb:

let
  num = "0123456789"
  lo = "abcdefghijklmnopqrstuvwxyz"
  up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  spec = raw"!@#$%^&*()-+"

  numI,loI,upI,specI=1,1,1,1
  n=parse(Int,readline())
  s=readline()
  for c in s
    while true
      if occursin(c,num) numI=0; break end
      if occursin(c,lo) loI=0; break end
      if occursin(c,up) upI=0; break end
      if occursin(c,spec) specI=0; break end
      break
    end
  end
  m=sum((numI,loI,upI,specI)) 
  # println("m=",m)
  n+=m
  if n<6 m+=(6-n) end
  println(m)
end

