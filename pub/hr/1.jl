# for line in readlines()
#   for v in split(line)
#     print(v," ")
#   end
#   print("\n")
# end
# https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem

let 
  function f(n)
    n-parse(Int,reverse(string(n)))
  end
  a,b,c=split(readline())
  a=parse(Int,a)
  b=parse(Int,b)
  c=parse(Int,c)
  res=0
  for n in a:b
    if 0 == mod( f(n), c )
      res += 1
    end
  end
  println( res )
end