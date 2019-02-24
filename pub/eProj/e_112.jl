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

# id(k)= binomial(8+k,k)+binomial(9+k,k)-10
# nid=id(1)+id(2)
# n=10^2-1

# itt egy while kellene és csak 1x végigmenni
# ez egy kísérletezgetős változat
fr, to = 100, 2000000
a=cumsum( bouncy.( fr:to ) )
b=fr:to
b[ a .// b .== 99//100 ]
