function next_premute!(p::AbstractVector)
    n = length(p)
    k = 0
    for i in reverse(1:n-1)
        if p[i] < p[i + 1]
            k = i
            break
        end
    end
    k == firstindex(p) - 1 && return nothing
    i = k + 1
    while i < n && p[i + 1] > p[k]
        i += 1
    end
    p[k], p[i] = p[i], p[k]
    reverse!(@view p[k+1:end])
    return p
end

global p = [1,2,3,4]
println(p)
while !isnothing(p)
    global p = next_premute!(p)
    println(p)
end