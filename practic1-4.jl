function gcd(a::T, b::T) where T
    while !iszero(b)
        a,b=b,rem(a%b)
    end
    return abs(a)
end

function remdiv(a::T,b::T) where T
    r = rem(a,b)
    k = div(a,b)
    return r,k
end

function gcdx_(a::T, b::T) where T
    u, v = one(T), zero(T)
    u_, v_ = v, u
    while !iszero(b)
        r, k = remdiv(a,b) 
        a, b = b, r 
        u, u_ = u_, u-k*u_ 
        v, v_ = v_, v-k*v_
    end
    if isnegative(a) 
        a, u, v = -a, -u, -v
    end
    return a, u, v 
end

function diophant_solve(a::T,b::T,c::T) where T
    d, x, y = gcdx_(a::T, b::T)
    if (c % d != 0)
        return false
    else
        e = c / d
        x = x * e
        y = y * e
        return x, y
    end
end

isnegative(a::Integer) = (a < 0)

println(diophant_solve(3,6,9))