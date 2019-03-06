# generating all (0,1) sequences
let
  maxlevel=3
  akt=Array{Char}(undef, maxlevel)
  function gen(level)
    #println(level," ",maxlevel)
    if level>maxlevel
      println(join(akt))
    else
      akt[level]='0'
      gen(1+level)
      akt[level]='1'
      gen(1+level)
    end
  end

  gen(1)
end