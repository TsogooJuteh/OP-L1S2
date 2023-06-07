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

#gcd(return a) = a * u + b * v  gcd - Наибольший делитель

isnegative(a::Integer) = (a < 0)

println(gcdx_(3,11))

#from here, we are finding that u and v are the coefficients that satisfy Bézout's identity.