# https://www.hackerrank.com/challenges/picking-numbers/problem
function pickingNumbers( a )
    sort!(a)
    n=length(a)
    a=cat(a, -1, dims=1) # őrszem
    l0, l1 = 0, 1
    i, pa = 2, a[ 1 ]
    res = 0
    while true
      if a[i] == pa
          l1 += 1
      else
          res = max(res, l0+l1)
          l0 = pa + 1 == a[i] ? l1 : 0
          l1 = 1
          pa = a[i]
      end
      if pa < 0 break end
      i += 1
    end
    res
end

line=readline()
n=parse(Int,line)
line=readline()
a=parse.(Int,split(line))
println(pickingNumbers(a))
