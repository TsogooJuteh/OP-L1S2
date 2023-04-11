function factorization(n::T) where T
    factors = []
    d = 2
    while (n>1)
        while n%d == 0
            push!(factors,d)
            n /= d
        end
        d += 1
        if d^2 > n
            if n>1
                push!(factors,n)
            end
            break
        end
    end
    return factors
end

println(factorization(60))