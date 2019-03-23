f(x)=x^2
A = rand(3, 3)
println(A)
println(f(A))
v = rand(3)
f(v) # HIBA!
