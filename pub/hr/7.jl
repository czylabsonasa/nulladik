# https://www.hackerrank.com/challenges/find-digits/problem

esetek = parse(Int, readline())
for _ in 1:esetek
  inp = readline()
  szám = parse(Int, inp)
  dig = parse.(Int, collect(inp))
  frek = zeros(Int,9)
  for v in dig
    if v>0 frek[v] += 1 end
  end
  println( sum( frek[ 0 .== (szám .% (1:9)) ] ) )
end
