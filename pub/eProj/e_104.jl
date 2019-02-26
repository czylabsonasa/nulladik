let
  f1,f2=big(1),big(1)
  n=2
  while true
    f1, f2 = f2, f1 + f2
    n += 1
    if 0 == n % 33 print("*") end
    if n < 2750 continue end
    sf = string(f2)
    if 123456789 == parse(Int, join(sort(collect( sf[1:9] )))) && 123456789 == parse(Int, join(sort(collect( sf[end-8:end] ))))
      println("\n", n)
      break
    end
  end
end
# 329468, vagy 5 percig futott