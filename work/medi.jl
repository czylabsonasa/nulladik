# https://www.hackerrank.com/challenges/find-the-median/problem

let
  readline()
  arr=sort!(parse.(Int,split(readline())))
  n=length(arr)
  println(arr[div(n+1,2)])
end
