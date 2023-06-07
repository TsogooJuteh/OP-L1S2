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

function insertion_sort!(v::Vector{T}) where T
    for i in 2:length(v)
        j = i
        while j > 1 && v[j] < v[j-1]
            v[j], v[j-1] = v[j-1], v[j]
            j -= 1
        end
    end
end

function insertion_sortperm(v::Vector{T}) where T
    perm = collect(1:length(v))
    for i in 2:length(v)
        j = i
        while j > 1 && v[perm[j]] < v[perm[j-1]]
            perm[j], perm[j-1] = perm[j-1], perm[j]
            j -= 1
        end
    end
    return perm
end

function insertion_sortperm!(perm::Vector{Int}, v::Vector{T}) where T
    for i in 2:length(v)
        j = i
        while j > 1 && v[perm[j]] < v[perm[j-1]]
            perm[j], perm[j-1] = perm[j-1], perm[j]
            j -= 1
        end
    end
end

v = [4, 2, 3, 1]
println(insertion_sort(v))
insertion_sort!(v)
println(v)

v = [4, 2, 3, 1]
perm = insertion_sortperm(v)
println(perm)

v = [4, 2, 3, 1]
perm = collect(1:length(v))
insertion_sortperm!(perm, v)
println(perm)
