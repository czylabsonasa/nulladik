# https://www.hackerrank.com/challenges/hackerrank-in-a-string/problem
function solve(sztr)
  sztr=[ c for c in sztr if c in "hackern" ]
  n=length(sztr)
  println("n=",n)
  i=1
  for c in "hackerrank"
    if i>n return "NO" end
    ii=findfirst(isequal(c),sztr[i:n])
    if nothing==ii return "NO" end
println(sztr[i])
    i=i+ii
  end
  "YES"
end

T=parse(Int,readline())
for _ in 1:T
  println( solve(lowercase(readline())))
end