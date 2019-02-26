n=10000
lista=Dict()
for num in 2:n
  n3=num^3
  k=join(sort(collect(string(n3))))
  if haskey(lista, k)
    push!(lista[k], n3)
  else
    lista[k]=[n3]
  end
end
for (_,a) in lista
  length(a)>4 ? println(a) : nothing
end
  