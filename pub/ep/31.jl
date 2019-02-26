let 

  function coin( n , c ) 
    ways = zeros( Int, n+1 ) # lehetne offsetarray is...
    ways[ 1 ] = 1 # ez a nulla
    for ci in c
      for i in 1:(n+1-ci)
        ways[i+ci] += ways[i]
      end
    end
    ways
  end
  
  s = time_ns() 
  res = coin( 200, [1,2,5,10,20,50,100,200] )
  println( ( time_ns() - s ) / 1e9 )
  println(res[201])



end