# https://www.hackerrank.com/challenges/the-birthday-bar/problem
let
  n = parse(Int, readline())
  s = parse.(Int, split(readline()))
  (d,m) = parse.(Int, split(readline()))
  res=0
  if n>=m
    for it=m:n
      res += sum(s[(it-m+1):it])==d ? 1 : 0
    end
  end
  println(res)
end