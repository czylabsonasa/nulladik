let 

  function collatz( n )
    pre = zeros( Int, n )
    pre[ 1 ] = 1
    for i in 2:n
      lánc, tn = 1, i
      while tn > 1
        tn = ( 0 == mod( tn, 2 ) ) ? div( tn, 2 ) : 3*tn+1
        lánc += 1
      end
      pre[ i ] = lánc
    end
    pre
  end
  
  s = time_ns() 
  res = collatz( 1000000 )
  println( ( time_ns() - s ) / 1e9 )

  mx = maximum( res[1:999999] )
  println([ i for i in 1:length(res) if res[i]==mx ] )


end