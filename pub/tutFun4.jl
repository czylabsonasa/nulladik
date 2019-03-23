f(x)=x^2
println( broadcast(f, [1, 2, 3]) )
println( [f(1), f(2), f(3)] )
println( broadcast(x -> x^3, [1, 2, 3]) )
println( f.([1, 2, 3]) )


