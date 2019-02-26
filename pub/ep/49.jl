function isPrime3(n)
  if n<5 return (false,true,true,false)[n] end
  if 0==mod(n,2) || 0==mod(n,3) return false end
  d=5
  while d*d<=n # itt nekünk kell kezelni a ciklusváltozót
    if 0==mod(n,d) return false end
    d+=2
  end
  true
end

a, b = 100000, 999999
pr=(a:b)[ isPrime3.(a:b) ]
lista=Dict()
for p in pr
  k=join(sort(collect(string(p))))
  if haskey(lista, k)
    push!(lista[k], p)
  else
    lista[k]=[p]
  end
end
for (_,ar) in lista
  #length(ar)>2 ? println(ar) : nothing
  lar=length(ar)
  if lar > 2
    for m in 2:lar-1
      arm=ar[m]
      l,r = m-1,m+1
      while l>0 && r<=lar
        if arm-ar[l] < ar[r]-arm l -= 1; continue end
        if arm-ar[l] > ar[r]-arm r += 1; continue end
        println(ar[l]," ",arm, " ", ar[r])
        l -= 1
        r += 1
      end
    end
  end
end
  