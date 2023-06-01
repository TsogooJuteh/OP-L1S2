function next_repit_placement!(p::Array{T,1}, n::T) where T<:Integer
    i = findlast(x->(x < n), p)
    isnothing(i) && ( return nothing )
    p[i] += 1
    p[i + 1:end] .= 1
    return p 
end

n = 2
k = 3
global p = ones(Int, k)
while !isnothing(p)
    global p = next_repit_placement!(p, n)
    if !isnothing(p)
        println(p)
    end
end
