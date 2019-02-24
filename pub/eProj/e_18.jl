let
  input = readlines()
  r0 = parse.( Int, split( input[ 1 ] ) )
  for line in input[ 2:end ]
    r1 = parse.( Int, split( line ) )
    n1 = length( r1 )
    r1[1] += r0[1]
    r1[end] += r0[end]
    for i in 2:n1-1
      r1[ i ] += max( r0[ i-1 ], r0[ i ] )
    end
    r0 = r1
  end
  println( maximum( r0 ) )
end