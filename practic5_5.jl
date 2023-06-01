function hoaresort!(v::Vector{T}, low::Int=1, high::Int=length(v)) where T
    if high > low
        pi = partition!(v, low, high)
        hoaresort!(v, low, pi - 1)
        hoaresort!(v, pi + 1, high)
    end
    return v
end

function partition!(v::Vector{T}, low::Int, high::Int) where T
    pivotIndex = rand(low:high)
    v[pivotIndex], v[high] = v[high], v[pivotIndex]
    pivot = v[high]
    i = low - 1
    for j = low:high-1
        if v[j] <= pivot
            i += 1
            v[i], v[j] = v[j], v[i]
        end
    end
    v[i + 1], v[high] = v[high], v[i + 1]
    return i + 1
end

function merge_sort(v::Vector{T}) where T
    if length(v) <= 1
        return v
    end

    mid = length(v) ÷ 2
    left_half = merge_sort(v[1:mid])
    right_half = merge_sort(v[mid+1:end])

    merge(left_half, right_half)
end

function merge(left::Vector{T}, right::Vector{T}) where T
    sorted = T[]
    while !isempty(left) && !isempty(right)
        if left[1] <= right[1]
            push!(sorted, popfirst!(left))
        else
            push!(sorted, popfirst!(right))
        end
    end

    append!(sorted, left)
    append!(sorted, right)

    return sorted
end

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

println("Timing for merge sort:")
@time merge_sort(copy(v))

println("Timing for Hoare sort (Quick sort):")
@time hoaresort!(copy(v))