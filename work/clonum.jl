# https://www.hackerrank.com/challenges/closest-numbers/problem
# rendezés + linear scan
let
  n=parse(Int,readline())
  arr=sort!(parse.(Int,split(readline())))
  n=length(arr) # mert van egy invalid test eset
  opt=arr[2]-arr[1]
  sol=[1]
  for i in 2:n-1
    d=arr[i+1]-arr[i]
    if d<opt
      opt=d
      sol=[i]
      continue
    end
    if d==opt
      push!(sol, i)
    end
  end
  for i in sol 
    print(arr[i]," ",arr[i+1]," ")
  end
  println()
end