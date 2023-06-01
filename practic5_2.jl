function combsort(v::Vector{T}) where T
    gap = length(v)
    shrink = 1.3
    sorted = false
    while !sorted
        gap = max(floor(Int, gap / shrink), 1)
        sorted = true
        for i in 1:(length(v)-gap)
            if v[i] > v[i + gap]
                v[i], v[i + gap] = v[i + gap], v[i]
                sorted = false
            end
        end
    end
    return v
end

function bubblesort(v::Vector{T}) where T
    n = length(v)
    for i in 1:n
        for j in 1:(n-i)
            if v[j] > v[j + 1]
                v[j], v[j + 1] = v[j + 1], v[j]
            end
        end
    end
    return v
end

v = rand(1:1000, 5000)
@time bubblesort(v)

v = rand(1:1000, 5000)
@time combsort(v)
