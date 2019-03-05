# let
#   st, p = [], nothing
#   for c in readline()
#     if c != p
#       push!(st,c) 
#       p=c
#     else
#       st = st[1:end-1]
#       p = nothing
#       if length(st)>0 p=st[end] end
#     end
#   end
#   if length(st)>0 
#     println(join(st))
#   else
#     println("Empty String")
#   end
# end
let
  st = ['_']
  for c in readline()
    c != st[end] ? push!(st,c) : (st = st[1:end-1])
  end
  length(st)>1 ? println(join(st[2:end])) : println("Empty String")
end
