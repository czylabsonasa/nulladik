###############################################
# preu 39
###############################################
n=1000
frek=zeros(n)
for a in 2:div(n,3), b in (a+1):div(n-a,2), c in b+1:n-(a+b)
  if a^2+b^2 == c^2
    println(a+b+c," ",a," ",b," ",c)
    frek[a+b+c] += 1
  end
end
mx=maximum(frek)
(1:n)[frek .== mx]
