# https://www.hackerrank.com/challenges/permutation-equation/problem
n = parse(Int, readline())
p = parse.(Int, split(readline()))
q = zeros(Int, n)
q[p] = 1:n
q = q[q]
for v in q
  println(v)
end
