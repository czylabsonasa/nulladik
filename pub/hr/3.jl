# for line in readlines()
#   for v in split(line)
#     print(v," ")
#   end
#   print("\n")
# end
# a, b, c = split( readline() )
# a, b, c = parse.( Int, ( a, b, c ) )

# https://www.hackerrank.com/challenges/counting-valleys/problem
# julia unsupported for this challenge.... :-(
let 
  
    nt = parse( Int, readline() )
  path = readline()
  nv, s, kint = 0, 0, 1
  for c in path
    s += ( 'U' == c ) ? 1 : -1
    if s<0 
      nv += kint
      kint = 0
    else
      kint = 1
    end
  end
  println( nv )

end
