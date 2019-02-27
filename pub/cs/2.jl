# https://app.codesignal.com/challenge/sxPtiyRqLZsL3y75j

function differentSquares(mtx::Vector{Vector{Int32}})
    d = Dict{Int,Int}()
    r, c = length(mtx), length(mtx[1])
    for ir in 1:r-1
        m0, m1 = mtx[ir], mtx[ir+1]
        for ic in 1:c-1
            d[1000*m0[ic]+100*m0[ic+1]+10*m1[ic]+m1[ic+1]] = 1
        end
    end
    res=0
    for ( _, v ) in d res += v end
    res
end