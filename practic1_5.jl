struct Residue{T,M}
    a::T
    function Residue{T,M}(a) where {T,M}
        return new(mod(a,M))
    end
end

function +(x::Residue, y::Residue)
    return Residue(x.a + y.a)
end

function -(x::Residue, y::Residue)
    return Residue(x.a - y.a)
end

function -(x::Residue)
    return Residue(-x.a)
end

function *(x::Residue, y::Residue)
    return Residue(x.a * y.a)
end

function ^(x::Residue, n::Integer)
    if n < 0
        x = x^(-n)
        return inv(x)
    end
    y = Residue(1)
    while n > 0
        if isodd(n)
            y *= x
        end
        x *= x
        n = n ÷ 2
    end
    return y
end
function inv(x::Residue)
    a, b, u, v = x.a, M, 1, 0
    while a != 0
        q, r = divrem(b, a)
        u, v = v, u - q * v
        b, a = a, r
    end
    if b != 1
        error("Residue is not invertible.")
    end
    return Residue(u)
end

println(+(12, 54))