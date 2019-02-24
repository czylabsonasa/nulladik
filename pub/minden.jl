# jelölések:
# preu num : Euler

###############################################
# egyedi prímteszt 
###############################################
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


###############################################
# Eratosztenészi szita
###############################################
function prímSzita(n)
  sz=ones(Int8,n)
  sz[1] = 0
  sz[4:2:n] .= 0
  for i in 3:2:n
    if i*i > n break end
    if 0 == sz[i] continue end
    sz[ i*i : 2i : n ] .= 0
  end
  sz
end



###############################################
# preu 1
###############################################
n,p,q = 20,3,5;
out = [ s for s in 1:n if 0==s%p || 0==s%q ];
sum( out )

###############################################
# preu 2
###############################################
start=time_ns()
f0, f1 = 1, 1
s, határ = 0, 4000000
while f1 <= határ
  s += ( 0 == f1 % 2 ) ? f1 : 0
  #println(s)
  f0, f1 = f1, f0 + f1
end
println(s)
println("elepsed time: ", (time_ns()-start)/1e9, " sec")


###############################################
# preu 3
###############################################
# n = 600851475143
n = 2 * 3 * 5 * 7 * 11 * 13
prímek=[]
p=2
while n>1 && p*p<=n
  while 0==n%p
    push!(prímek,p)
    n=div(n,p)
  end
  p += 1
end
if n > 1
  push!(prímek,n)
end
println(prímek)

###############################################
# preu 4
###############################################
mx, n1, n2 = -1,-1,-1
for i in 100:999, j in i:999 # nested loop!
  #println(i," ",j)
  k, sk = i*j, string(k)
  if sk == reverse(sk) && k > mx
    mx,n1,n2=k,i,j
  end
end
mx,n1,n2


###############################################
# preu 5
###############################################
function gcd(a,b)
  while (c=a%b)>0
    a,b = b,c
  end
  b
end
function lcm(v)
  sol=v[1]
  for n in v[2:end]
    sol = div(sol*n, gcd(sol,n))
  end
  sol
end
lcm(1:20)

###############################################
# preu 6
###############################################
v=1:100
sum(v).^2 - sum(v.^2)
# + képletek...

###############################################
# preu 7
###############################################
pr = [ 3,5,7,11 ]
lim = 10001
npr = 5
n = 13
while npr < lim
  i, ip = 1, true
  while pr[i]^2 <= n # miért nem kell i<=h ???
    if 0 == n%pr[i] 
      ip = false; break 
    end
    i += 1
  end
  if true == ip 
    npr += 1
    push!( pr, n ) 
  end
  n += 2
end
pr[ npr-1 ]

###############################################
# preu 9
###############################################
n=1000
for a in 2:div(n,3), b in (a+1):div(n-a,2)
  c=n-(a+b);
  if a^2+b^2 == c^2
    println(a," ",b," ",c," ",a*b*c)
  end
end

###############################################
# preu 10
###############################################
pr = [ 3,5,7,11 ]
#lim = 150001
npr = 5
n = 13
while pr[npr-1] < 2000000
  i, ip = 1, true
  while pr[i]^2 <= n 
    if 0 == n%pr[i] 
      ip = false; break 
    end
    i += 1
  end
  if true == ip 
    npr += 1
    push!( pr, n ) 
  end
  n += 2
end
println(pr[ npr-1 ])
2+sum(pr[1:npr-2])

###############################################
# preu 12
function osztókSzáma(n)
  sz = ones( Int, n )
  sz[ 2 ] = 2
  sz[ 4:2:n ] .= 2
  for i in 3:2:n
    if i*i > n break end
    if 1 == sz[ i ] 
      for j in (i*i):2*i:n
        sz[ j ] = i
      end
    end
  end

  for i in 2:n
    szi = sz[ i ]
    if 1 == szi
      sz[ i ] = 2
      continue
    end
    ti, k = i, 0 # szorozni->teszt (nem gyorsít)
    while 0 == ti % szi  
      ti = div( ti, szi )
      k += 1
    end
    sz[ i ] = ( k + 1 )*sz[ ti ]
  end
  sz
end

n = 100000000
d = osztókSzáma(n)
f(x) = div(x*(x+1),2)
tlim = Int(floor((sqrt(1+8*n)-1)/2))
for i in 1:tlim
  if d[f(i)] > 400 
    println( i, " ", f(i), " ", d[f(i)] ); 
    break 
  end
end

###############################################
# preu 13
###############################################
let 
  s = big( 0 )
  for line in readlines()
    s += parse( BigInt, line )
  end
  println( string(s)[1:10] )
end

###############################################
# preu 14
###############################################
let 
  function collatz( n )
    pre = zeros( Int, n )
    pre[ 1 ] = 1
    for i in 2:n
      lánc, tn = 1, i
      while tn > 1
        tn = ( 0 == mod( tn, 2 ) ) ? div( tn, 2 ) : 3*tn+1
        lánc += 1
      end
      pre[ i ] = lánc
    end
    pre
  end
  
  s = time_ns() 
  res = collatz( 1000000 )
  println( ( time_ns() - s ) / 1e9 )

  mx = maximum( res[1:999999] )
  println([ i for i in 1:length(res) if res[i]==mx ] )
end

###############################################
# preu 15
###############################################
# egyedi (nem táblázatos) és nem túl hatékony 
binCoeff(n, k) = div( prod(k+1:big(n)), prod(1:n-k) ) 
println( binCoeff(40, 20) )

###############################################
# preu 16
###############################################
println( sum( digits(big(2)^1000 ) ) )

###############################################
# preu 18
###############################################
let
  input = readlines()
  r0 = parse.( Int, split( input[ 1 ] ) )
  for line in input[ 2:end ]
    r1 = parse.( Int, split( line ) )
    n1 = length( r1 )
    r1[1] += r0[1]
    r1[end] += r0[end]
    for i in 2:n1-1
      r1[ i ] += max( r0[ i-1 ], r0[ i ] )
    end
    r0 = r1
  end
  println( maximum( r0 ) )
end

###############################################
# preu 31
###############################################
let 
  function coin( n , c ) 
    ways = zeros( Int, n+1 ) # lehetne offsetarray is...
    ways[ 1 ] = 1 # ez a nulla
    for ci in c
      for i in 1:(n+1-ci)
        ways[i+ci] += ways[i]
      end
    end
    ways
  end
  
  s = time_ns() 
  res = coin( 200, [1,2,5,10,20,50,100,200] )
  println( ( time_ns() - s ) / 1e9 )
  println(res[201])
end

###############################################
# preu 62
# indexelés, Bentley
###############################################
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
  
###############################################
# preu 49
###############################################
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

a, b = 1000, 9999
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


###############################################
# preu 112
function bouncy(num) 
  s=parse.( Int8, collect(string(num)) )
  ls1 = length(s)-1
  up, down = false, false
  for i in 1:ls1
    if s[i]>s[i+1] down = true; continue end
    if s[i]<s[i+1] up = true; continue end
  end
  ( true==up && down ) ? 1 : 0
end


###############################################

###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################
###############################################

