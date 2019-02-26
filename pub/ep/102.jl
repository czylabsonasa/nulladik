let
  function side(A,B,P)
    (A[2]-B[2])*(P[1]-A[1])+(B[1]-A[1])*(P[2]-A[2])
  end
  function sameSide(A,B,P,Q)
    side(A,B,P)*side(A,B,Q)>=0
  end
  function inTri(A,B,C,P)
    M = ( A .+ B .+ C ) ./ 3
    sameSide(A,B,P,M) && sameSide(A,C,P,M) && sameSide(B,C,P,M)
  end

  nAll, nGood=0,0
  for line in readlines()
    co = parse.(Int,split(line,","))
    A,B,C = co[1:2],co[3:4],co[5:6]
    nGood += ( true == inTri(A,B,C,[0,0]) ) ? 1 : 0
    nAll += 1
  end
  println(nGood, " ", nAll)
end