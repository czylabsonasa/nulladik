n=parse(Int,readline())
d = (1:n)[ mod.(n,1:n) .== 0 ]
ds=sum.(digits.(d))
println(d[ds .== maximum(ds)][1])
