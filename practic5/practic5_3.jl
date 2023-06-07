function shellsort(v::Vector{T}) where T
    gap = length(v) ÷ 2
    while gap > 0
        for i in (gap+1):length(v)
            j = i
            while j > gap && v[j-gap] > v[j]
                v[j-gap], v[j] = v[j], v[j-gap]
                j -= gap
            end
        end
        gap ÷= 2
    end
    return v
end

function insertion_sort(v::Vector{T}) where T
    sorted_v = copy(v)
    for i in 2:length(sorted_v)
        j = i
        while j > 1 && sorted_v[j] < sorted_v[j-1]
            sorted_v[j], sorted_v[j-1] = sorted_v[j-1], sorted_v[j]
            j -= 1
        end
    end
    return sorted_v
end

v = rand(1:10000, 5000)

println("Timing for insertion sort:")
@time insertion_sort(copy(v))

println("Timing for shell sort:")
@time shellsort(copy(v))