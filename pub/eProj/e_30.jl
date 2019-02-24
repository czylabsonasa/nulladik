###############################################
# preu 30
# teljesen brute force

res = []
lim = 6*9^5
for num in 2:lim
  if sum( parse.( Int, collect(string(num))) .^5 ) == num 
    push!( res, num )
  end
end


