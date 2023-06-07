function gcd_(a::T, b::T) where T
    while !iszero(b)
        a, b = b, rem(a,b)
    end
    return abs(a)
end

println(gcd_(12,9))