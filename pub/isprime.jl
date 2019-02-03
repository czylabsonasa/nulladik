let
# teljesen bf
function isPrime0(x)
  ans=false
  if x>1 
    ans=true
    for d in 2:(x-1)
      if 0==mod(x,d)
        ans=false
        break
      end
    end
  end
  ans
end

# atszervezes, felkeszulunk a bonyolultabb kodra
function isPrime1(x)
  if x<=1 return false; end
  for d in 2:(x-1)
    if 0==mod(x,d) return false; end
  end
  true
end


# nehany trivialitas beepitese
function isPrime2(x)
  if x<5 return (false,true,true,false)[x] end
  if 0==mod(x,2) || 0==mod(x,3) return false end
  for d in 5:2:(x-1)
    if 0==mod(x,d) return false end
  end
  true
end

# gyokos hatar beepitese
function isPrime3(x)
  if x<7 return (false,true,true,false,true,false)[x] end
  if 0==mod(x,2) || 0==mod(x,3) || 0==mod(x,5) return false end
  d=7
  while d*d<=x
    if 0==mod(x,d) return false end
    d+=2
  end
  true
end



h=1:100000
@time r0=isPrime0.(h) 
@time r1=isPrime1.(h) 
@time r2=isPrime2.(h) 
@time r3=isPrime3.(h) 
r3==r0 && r2==r0

#println(isPrime.([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]))

# for x in split(readline())
#   if true==isPrime(parse(Int,x))
#     println("prím")
#   else
#     println("nem prím")
#   end
# end

end