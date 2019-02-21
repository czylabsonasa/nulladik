function osztókSzáma(n)
  sz=ones(Int,n)
  sz[ 4:2:n ] .= 2
  for i in 3:2:n
    if i*i > n break end
    if 1 == sz[ i ] 
      for j in i*i:2*i:n
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
    ti, k = i, 0 # szorozni->teszt
    while 0 == ti % szi  
      ti = div( ti, szi )
      k += 1
    end
    sz[ i ] = ( k + 1 )*sz[ ti ]
  end
  sz
end

function osztókSzáma2(n)
  sz=ones(Int,n)
  sz[ 4:2:n ] .= 2
  for i in 3:2:n
    if i*i > n break end
    if 1 == sz[ i ] 
      for j in i*i:2*i:n
        sz[ j ] = i
      end
    end
  end
  for i in 2:n
    p = sz[ i ]
    if 1 == p
      sz[ i ] = 2
      continue
    end
    pp, k = p, 0 # szorozni->test->ok->no change
    while 0 == i % pp
      pp *= p
      k += 1
    end
    sz[ i ] = ( k + 1 )*sz[ div( i, div( pp, p ) ) ]
  end
  sz
end




function prímSzita(n)
  sz=ones(Int8,n)
  sz[1] = 0
  sz[4:2:n] .= 0
  for i in 3:2:n
    if i*i > n break end
    if 0 == sz[i] continue end
    sz[ i*i : 2i : n ] .= 0
  end
  sz
end
