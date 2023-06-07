function next_repit_placement!(p::Array{T,1}, n::T) where T<:Integer
    i = findlast(x->(x < n), p)
    isnothing(i) && ( return nothing )
    p[i] += 1
    p[i + 1:end] .= 1
    return p 
end

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

indicator(i::Integer, n::Integer) = digits(Bool, i; base = 2, pad = n)

function next_indicator!(indicator::AbstractVector{Bool})
    i = findlast(x->(x == 0), indicator)
    isnothing(i) && return nothing
    indicator[i] = 1
    indicator[i + 1:end] .= 0
    return indicator
end

indicator_func(i::Integer, n::Integer) = digits(Bool, i; base = 2, pad = n)

function next_indicator!(indicator::AbstractVector{Bool}, k)
    i = lastindex(indicator)
    while indicator[i] == 0
        i -= 1
    end
    m = 0
    while i >= firstindex(indicator) && indicator[i] == 1
        m += 1
        i -= 1
    end
    if i < firstindex(indicator)
        return nothing
    end
    indicator[i] = 1
    indicator[i + 1:i + m - 1] .= 0
    indicator[i + m:end] .= 1
    return indicator
end

function next_split!(s::AbstractVector{Integer}, k::Integer)
    k == 1 && return nothing
    i = k - 1
    while i > 1 && s[i - 1] == s[i]
        i -= 1
    end
    s[i] += 1
    r = sum(@view(s[i + 1: k]))
    k = i + r - 1
    s[i + 1:n - k] .= 1
    return s, k
end

abstract type AbstractCombinObject
end

Base.iterate(obj::AbstractCombinObject) = (get(obj), nothing)
Base.iterate(obj::AbstractCombinObject, state) =
if isnothing(next!(obj)) # == false
    nothing
else
    (get(obj), nothing)
end

struct RepitPlacement{N, K} <: AbstractCombinObject
    value::Vector{Int}
    RepitPlacement{N, K}() where {N, K} = new{ones(Int, K)}
end

Base.get(p::RepitPlacement) = p.value
next!(p::RepitPlacement{N, K}) where {N, K} = next_repit_placement!(p.value, N)

for a in RepitPlacement{2,3}()
    println(a)
end

struct Permute{N} <: AbstractCombinObject
    value:Vector{Int}
    Permute{N}() where N = new(collect(1:N))
end

Base.get(obj::Permute) = obj.value
next!(permute::Permute) = next_premute!(permute.value)

for p in Permute{4}
    println(p)
end

struct Subsets{N} <: AbstractCombinObject
    indicator::Vector{Bool}
    Subsets{N}() where N = new(zeros(Bool, N))
end

Base.get(sub::Subsets) = sub.indicator
next!(sub::Subsets) = next_indicator!(sub.indicator)

for sub in Subsets{4}()
    println(sub)
end

struct KSubsets{M, K} <: AbstractCombinObject
    indicator::Vector{Bool}
    KSubsets{M, K}() where {M, K} = new([zeros(Bool, length(M) - K); ones(Bool, K)])
end

Base.get(sub::KSubsets) = sub.indicator
next!(sub::KSubsets{M, K}) where {M, K} = next_indicator!(sub.indicator, K)

for sub in KSubsets{1:6, 3}()
    sub |> println
end

struct NSplit{N} <: AbstractCombinObject
    value::Vector{Int}
    num_terms::Int
    NSplit{N}() where N = new(collect(1:N), N)
end

Base.get(nsplit::NSplit0) = nsplit.value[begin:nsplit.num_terms]
function next!(nsplit::NSplit)
    nsplit.value, nsplit.num_terms = next_split!(nsplit.value, nsplit.num_terms)
    get(psplit)
end

for s in NSplit{5}()
    println(s)
end

function dfs(graph::Dict{I, Vector{I}}, vstart::I) where I <: Integer
    stack = [vstart]
    mark = zeros(Bool, length(graph))
    mark[vstart] = true
    while !isempty(stack)
        v = pop!(stack)
        for u in graph[v]
            if !mark[u]
                mark[u] = true
                push!(stack, u)
            end
        end
    end
end