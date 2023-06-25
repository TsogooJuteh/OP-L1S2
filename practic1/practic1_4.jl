function gcd(a::T, b::T) where T
    while !iszero(b)
        a,b=b,rem(a%b)
    end
    return abs(a)
end

function gcdx_(a::T, b::T) where T
    u, v = one(T), zero(T)
    u_, v_ = v, u
    while !iszero(b)
        k, r = divrem(a,b)
        a, b = b, r 
        u, u_ = u_, u-k*u_ 
        v, v_ = v_, v-k*v_
    end
    if isnegative(a) 
        a, u, v = -a, -u, -v
    end
    return a, u, v 
end

isnegative(a::Integer) = (a < 0)

function diophant_solve(a::T,b::T,c::T) where T
    d, x, y = gcdx_(a::T, b::T)
    if (c % d != 0) # checks if the c (the answer from ax + by) isn't divided by gcd/ проверяет если с (ответ из ax + by) не делится на НОД
        return "нет ответа для x,y"# a * x + b * y = c
    else #если с делится на НОД
        e = c / d
        x = x * e
        y = y * e
        return x, y # we found the x, y which do represent the solution to the ax + by = c/ мы нашли x, y, которые представляют собой решение задачи ax + by = c
    end
end

#println(gcdx_(3,4))

isnegative(a::Integer) = (a < 0)

println(diophant_solve(3,4,11))

#a*x + b*y = c, here we are finding x and y