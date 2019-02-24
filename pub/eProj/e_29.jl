###############################################
# preu 29
# teljesen brute force

let
  function osztók(num)
    ret=[]
    for d in 2:num-1
      0==mod(num, d) && push!(ret, d )
    end
    ret
  end

  alo, aup = 2, 100
  blo, bup = 2, 100

  function sol1(alo,aup,blo,bup)
  #  AUP=log(aup)
    összes = (aup-alo+1)*(bup-blo+1)
    for a in alo:aup
  #    A=log(a)
      for b in blo:bup
        for d in osztók(b)
          big(a)^d > aup && break # ugyanaz log-ra
  #        d*A>AUP && break
          összes -= 1
        end
      end  
    end
    összes
  end

  function sol2(alo,aup,blo,bup)
    res=[]
    for a in alo:aup, b in blo:bup
        push!(res, big(a)^b )
    end
    length( unique(res))
  end


  println(sol1(alo,aup,blo,bup))
  println(sol2(alo,aup,blo,bup))

end