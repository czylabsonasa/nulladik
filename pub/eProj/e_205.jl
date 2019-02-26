let 
function comp(nSide, nDie)
  X = ones(nSide) ./ (1.0*nSide)
  nX = nSide
  for k = 2:nDie
    nXX = nX+nSide
    XX = zeros(nXX)
    for s = k:nXX
      XX[s] = sum(X[max(k-1,s-nSide):min(nX,s-1)] ) / ( 1.0*nSide )
    end
    X, nX = XX, nXX
  end
  X
end

function compI(nSide, nDie)
  X = ones(Int, nSide)
  nX = nSide
  for k = 2:nDie
    nXX = nX+nSide
    XX = zeros(Int, nXX)
    for s = k:nXX
      XX[s] = sum(X[max(k-1,s-nSide):min(nX,s-1)] )
    end
    X, nX = XX, nXX
  end
  X
end

function compI2(nSide, nDie)
  X = zeros(Int, nDie*nSide)
  X[1:nDie] .= 1
  XX = zeros(Int, nDie*nSide)

  for k = 2:nDie
    fill!(XX,0)
    for s = (k-1):(k-1)*nSide
      for i = 1:nSide
        XX[s+i] += X[s]
      end
    end
    X, XX = XX, X
  end
  X
end

Y=compI2(4,9)
X=compI2(6,6)
println(sum(Y)==4^9)
println(sum(X)==6^6)

s=0
for k=9:36 
  s+=Y[k]*sum(X[6:k-1]) 
end
println( s / (1.0*6^6*4^9) )

Y=compI(4,9)
X=compI(6,6)
println(sum(Y)==4^9)
println(sum(X)==6^6)

s2=0
for k=9:36 
  s2+=Y[k]*sum(X[6:k-1]) 
end
println( s2 / (1.0*6^6*4^9) )

Y=comp(4,9)
X=comp(6,6)
s3=0.0
for k=9:36 
  s3+=Y[k]*sum(X[6:k-1]) 
end
println( s3 )

end