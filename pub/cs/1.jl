# https://app.codesignal.com/challenge/no4rPwbXE3pH6ET5E

function leastCommonPrimeDivisor(a::Int32, b::Int32)
    function lp(n)
        1==n && return -1
        0==n%2 && return 2
        0==n%3 && return 3
        d, delta = 5, 2
        while d*d <= n
            0==n%d && return d
            d += delta
            delta = 6 - delta
        end
        n
    end
    function gcd(a,b)
      while (c=a%b)>0
        a,b = b,c
      end
      b
    end    
    lp(gcd(a,b))    
end
