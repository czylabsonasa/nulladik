# naív ismétléses permutáció:
function iperm(ezt)
  szó=sort(collect(ezt))
  akt=copy(szó)
  hossz=length(szó)
  szabad=ones(Int,hossz)
  function bejár( szint )
    if szint>hossz
      println( join(akt) )
      return
    end
    előző=nothing
    for i = 1:hossz
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

