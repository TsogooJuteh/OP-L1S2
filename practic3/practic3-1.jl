function checkingprime(a::T) where T<:Integer
    if (a == 0 || a==1)
        return false
    end
    for d in 2:T(ceil(a/2))
        if a % d == 0
            return false
        end
    end
    return true
end

println(checkingprime(101))