function sqf(n)
  ( 0 == n%4 || 0 == n%9 ) && return false
  d, delta = 5, 2
  while d*d <= n
    0 == n % (d*d) && return false
    d += delta
    delta = 6 - delta
  end
  true
end
let
  # Q: van két egyforma szám a Pascal△ szigorú belsejében?
  # b(4,2)=b(6,1)
  # 8 is lehet: 3003,1=78,2=15,5=14,6 és a jobboldali párjaik

  sol=[1,2,3,6] # az eleje kézzel
  for n=5:50
    x=binomial.(n,1:n-1)
    sol=cat(sol, x[sqf.(x)], dims=1)
  end
  sol = unique(sol)
  println(sol)
  println(sum(sol))

end
