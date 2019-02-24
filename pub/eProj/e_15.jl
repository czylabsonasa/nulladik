# egyedi (nem táblázatos) és nem túl hatékony 
binCoeff(n, k) = div( prod(k+1:big(n)), prod(1:n-k) ) 
println( binCoeff(40, 20) )