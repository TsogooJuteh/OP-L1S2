function quickselect_median(v::Vector{T}, low::Int=1, high::Int=length(v)) where T
    if low == high
        return v[low]
    end
    pivotIndex = partition!(v, low, high)
    len = length(v)
    if len % 2 == 1
        if pivotIndex == len ÷ 2 + 1
            return v[pivotIndex]
        elseif pivotIndex > len ÷ 2 + 1
            return quickselect_median(v, low, pivotIndex - 1)
        else
            return quickselect_median(v, pivotIndex + 1, high)
        end
    else
        if pivotIndex == len ÷ 2
            return (v[pivotIndex] + v[pivotIndex + 1]) / 2.0
        elseif pivotIndex > len ÷ 2
            return quickselect_median(v, low, pivotIndex - 1)
        else
            return quickselect_median(v, pivotIndex + 1, high)
        end
    end
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

v = rand(1:100, 5075)
println("Median of v: ", quickselect_median(copy(v)))

v = rand(1:100, 2000)
println("Median of v: ", quickselect_median(copy(v)))
