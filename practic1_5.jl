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

struct Residue{T,M}
    a::T
    Residue{T,M}(a) where {T,M} = new(mod(a,M))
end

import Base: +, -, *, ^, -, inv, show

+(x::Residue{T,M}, y::Residue{T,M}) where {T,M} = Residue{T,M}(x.a + y.a)

-(x::Residue{T,M}, y::Residue{T,M}) where {T,M} = Residue{T,M}(x.a - y.a)

-(x::Residue{T,M}) where {T,M} = Residue{T,M}(-x.a)

*(x::Residue{T,M}, y::Residue{T,M}) where {T,M} = Residue{T,M}(x.a * y.a)

^(x::Residue{T,M}, y::Int) where {T,M} = Residue{T,M}(x.a ^ y)

function inv(x::Residue{T,M}) where {T,M}
    g, inv_x, _ = gcdx(x.a, M)
    if g != 1
        error("The element does not have an inverse.")
    end
    return Residue{T,M}(inv_x)
end

function show(io::IO, x::Residue)
    print(io, x.a)
end

x = Residue{Int, 7}(3)
y = Residue{Int, 7}(4)

println("x + y = ", x + y)
println("x - y = ", x - y)
println("-x = ", -x)
println("x * y = ", x * y)
println("x ^ 2 = ", x ^ 2)
println("inv(x) = ", inv(x))