# for line in readlines()
#   for v in split(line)
#     print(v," ")
#   end
#   print("\n")
# end
# a, b, c = split( readline() )
# a, b, c = parse.( Int, ( a, b, c ) )

# https://www.hackerrank.com/challenges/save-the-prisoner/problem

let 

  nt = parse( Int, readline() )
  for _ in 1:nt
    pri, swe, s = parse.( Int, split( readline() ) )
    println( 1+mod( s-1 + mod( swe-1, pri ), pri ) )
  end

end


# atirtam az online-editorban err, mert a 4. test timelimit lett
# function solve()
#     pri, swe, s = parse.( Int, split( readline() ) )
#     return 1+mod( s-1 + mod( swe-1, pri ), pri ) 
# end
# nt = parse( Int, readline() )
# for _ in 1:nt
#     println(solve())
# end