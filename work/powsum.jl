# https://www.hackerrank.com/challenges/the-power-sum/problem
# rekurzio

let
  N=parse(Int,readline())
  k=parse(Int,readline())

  lista=[] 
  c=1
  while c^k<=N
    push!(lista,c^k)
    c+=1
  end
  nLista=length(lista)
  all=0

  function gen(sum,i)
    while i<=nLista
      akt=lista[i]
      if sum+akt>N return end
      if sum+akt==N all+=1; return end
      if sum+akt<N 
        gen(sum+akt,i+1)
      end
      i+=1
    end
  end
  gen(0,1)

  println(all)
end