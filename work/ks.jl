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

using OffsetArrays
function ksDP( w, v, K )
  n=length(w)
  dp=OffsetArray{Int}(undef,0:K,0:n)
  dp[0,:] .= 0
  dp[:,0] .= 0
  for k in 1:K
    for i in 1:n
      mx=dp[k,i-1]
      if w[i]<=k 
        mx=max(mx, v[i]+dp[k-w[i],i-1])
      end
      dp[k,i]=mx
    end
  end
  dp[K,n]
end

function ksV3( w, v, K )
  data = [ (v[i], w[i]) for i in 1:length(v) ] 
  sort!( data, by=(x)->x[1]/x[2], rev=true )
  n=length(data)
  for i in 1:n v[i],w[i] = data[i] end
    
  function D(i,tK) # Dantzig korlát kiszámítása
    o=0.0
    while i<=n && tK>0
      t = min( tK, w[i] )
      tK -= t
      o += t*v[i]/(1.0*w[i])
      i += 1
    end
    Int(floor(o))
  end
  optV=0
  function bejár( szint, aktW, aktV )
    if szint > n
      optV=max( optV, aktV )
      return
    else
      if aktW+w[szint] <= K 
        bejár( 1+szint, aktW+w[szint], aktV+v[szint] )
      end
      if aktV + D( 1+szint, K-aktW ) > optV
        bejár( 1+szint, aktW, aktV )
      end
    end
  end
  bejár( 1, 0, 0 )
  optV
end


# v=[ 10, 5, 15, 7, 6, 18, 3 ]
# v=vcat(v,v)
# v=vcat(v,v)

# w=[ 2, 3, 5, 7, 1, 4, 1 ]
# w=vcat(w,w)
# w=vcat(w,w)

# K=15*4
# @time println( ks(w,v,K ) )
# @time println( ksV(w,v,K ) )
# @time println( ksDP(w,v,K ) )

n=1430
v=rand(200:400,n)
w=rand(200:400,n)
K=div(sum(w),3)*2
@time println( ksV3(w,v,K ) )
# @time println( ksV(w,v,K ) )
@time println( ksDP(w,v,K ) )


