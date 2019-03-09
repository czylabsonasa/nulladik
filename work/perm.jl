# naív ismétléses permutáció:
function iperm(ezt)
  szó=sort(collect(ezt))
  akt=copy(szó)
  n=length(szó)
  szabad=ones(Int,n)
  function bejár( szint )
    if szint>n
      println( join(akt) )
      return
    end
    előző=nothing
    for i = 1:n
      if 1==szabad[i] && előző != szó[i]
        szabad[i]=0
        akt[szint]=előző=szó[i]
        bejár( szint+1 )
        szabad[i]=1
      end
    end
  end
  bejár(1)
end

@time iperm("aaabbc")

