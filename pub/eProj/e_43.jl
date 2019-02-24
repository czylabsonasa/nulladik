###############################################
# preu 43
# rekurzió, visszalépéses

p=(0,0,0,2,3,5,7,11,13,17)
foglalt=zeros(Int8, 10)
akt=zeros(Int8, 10)
res=[]
function generál( level )
  if level > 10 
    push!( res, parse(Int, join(akt)) ) 
    return nothing 
  end
  for i in 0:9
    if 1 == foglalt[ i+1 ] continue end
    foglalt[ i+1 ] = 1
    akt[ level ] = i
    if level < 4 || 0 == mod( sum( [100,10,1] .* akt[level-2:level] ), p[ level ] )
      generál( 1 + level )
    end
    foglalt[ i+1 ] = 0
  end
  nothing
end

for i in 1:9
  foglalt[ i+1 ] = 1
  akt[ 1 ] = i
  generál( 2 )
  foglalt[ i+1 ] = 0
end  