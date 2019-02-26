# function prímSzita(n)
#   sz=ones(Int8,n)
#   sz[1] = 0
#   sz[4:2:n] .= 0
#   for i in 3:2:n
#     if i*i > n break end
#     if 0 == sz[i] continue end
#     sz[ i*i : 2i : n ] .= 0
#   end
#   sz
# end

function osztókSzáma(n)
  sz = ones( Int, n )
  sz[ 2 ] = 2
  sz[ 4:2:n ] .= 2
  for i in 3:2:n
    if i*i > n break end
    if 1 == sz[ i ] 
      for j in (i*i):2*i:n
        sz[ j ] = i
      end
    end
  end

  for i in 2:n
    szi = sz[ i ]
    if 1 == szi
      sz[ i ] = 2
      continue
    end
    ti, k = i, 0 # szorozni->teszt (nem gyorsít)
    while 0 == ti % szi  
      ti = div( ti, szi )
      k += 1
    end
    sz[ i ] = ( k + 1 )*sz[ ti ]
  end
  sz
end

n = 100000000
d = osztókSzáma(n)
f(x) = div(x*(x+1),2)
tlim = Int(floor((sqrt(1+8*n)-1)/2))
for i in 1:tlim
  if d[f(i)] > 400 
    println( i, " ", f(i), " ", d[f(i)] ); 
    break 
  end
end
