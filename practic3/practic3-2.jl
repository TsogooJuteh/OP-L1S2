function eratosthenes(n::Integer)
    primes = fill(true, n)
    primes[1] = false
    for p in 2:n
        primes[p] || continue
        for i in 2:div(n, p)
            primes[p*i] = false
        end
    end
    return findall(primes)
end

println(eratosthenes(30))