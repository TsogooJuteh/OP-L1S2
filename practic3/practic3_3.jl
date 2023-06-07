function eratosthenes(n::Integer)
    primes = fill(true, n)
    primes[1] = false
    for p in 2:Int(floor(sqrt(n)))
        primes[p] || continue
        for i in 2:div(n, p)
            primes[p*i] = false
        end
    end
    return findall(primes)
end

function degree(n,p)
    k = 0
    n, r = divrem(n,p)
    while n > 0 && r == 0
        k += 1
        n, r = divrem(n,p)
    end
    return k
end

function factorization(n::T) where T<:Integer
    list = NamedTuple{(:div, :deg), Tuple{T, T}}[]
    for p in eratosthenes(Int(floor(sqrt(n))))
        k = degree(n, p)
        if k > 0
            push!(list, (div = p, deg = k))
        end
    end
    return list
end

n = 100
result = factorization(n)
println(result)