# https://www.hackerrank.com/challenges/caesar-cipher-1/problem

let 
  ls = parse( Int, readline() )
  s = readline()
  sh = parse( Int, readline() )
  code = 
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
