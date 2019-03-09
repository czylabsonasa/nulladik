function ks(w, v, K )
  maxLevel=length(w)
  optV=0
  function bejár( i, aktV, aktW )
    if i>maxLevel
      optV=max(optV, aktV)
      return
    else
      if( aktW + w[i]<= K )
        bejár(1+i, aktV+v[i], aktW+w[i])
      end
      bejár(1+i, aktV, aktW )
    end
  end
  bejár(1,0,0)
  optV
end

function ksV(w, v, K )
  maxLevel=length(w)
  optV=0
  function bejárV( i, aktV, aktW, sumV )
    if i>maxLevel
      optV=max(optV, aktV)
      return
    else
      if( aktW + w[i]<= K )
        bejárV(1+i, aktV+v[i], aktW+w[i], sumV)
      end
      sumV -= v[i];
      if sumV > optV
        bejárV(1+i, aktV, aktW, sumV )
      end
    end
  end
  bejárV(1,0,0,sum(v))
  optV
end  


v=[ 10, 5, 15, 7, 6, 18, 3 ]
v=vcat(v,v)
v=vcat(v,v)

w=[ 2, 3, 5, 7, 1, 4, 1 ]
w=vcat(w,w)
w=vcat(w,w)

K=15*4
@time println( ks(w,v,K ) )
@time println( ksV(w,v,K ) )

