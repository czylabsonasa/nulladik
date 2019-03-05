# https://www.hackerrank.com/challenges/recursive-digit-sum/problem
let
  n,k=split(readline())
  k=parse(Int,k)
  n=sum(parse.(Int,collect(n)))*k
  while n>9
    n=sum(digits(n))
  end
  println(n)
end
