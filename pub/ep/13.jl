let 

  s = big( 0 )
  for line in readlines()
    s += parse( BigInt, line )
  end
  println( string(s)[1:10] )

end
