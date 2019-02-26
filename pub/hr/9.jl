# https://www.hackerrank.com/challenges/migratory-birds/problem
# julialess

let
  n = parse(Int, readline())
  s = parse.(Int, split(readline()))
  frek=zeros(Int,5)
  for v in s frek[v] += 1 end
  mx = maximum(frek)
  println( (1:5)[ frek .== mx ][1] )
end