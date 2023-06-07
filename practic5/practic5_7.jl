function counting_sort(v::Vector{T}) where T
    minval = minimum(v)
    maxval = maximum(v)
    count = zeros(Int, maxval - minval + 1)
    for x in v
        count[x - minval + 1] += 1
    end
    out = Vector{T}(undef, length(v))
    i = 1
    for (x, cnt) in enumerate(count)
        for _ = 1:cnt
            out[i] = x + minval - 1
            i += 1
        end
    end
    return out
end

v = [4, 2, 2, 8, 3, 3, 1]
println("Original: ", v)
sorted_v = counting_sort(v)
println("Sorted: ", sorted_v)
