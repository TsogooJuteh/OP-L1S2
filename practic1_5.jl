struct Residue{T,M}
    a::T
    function Residue{T,M}(a) where {T,M}
        return new(mod(a,M))
    end
end

# Define addition (+) of residues
function +(x::Residue, y::Residue)
    return Residue(x.a + y.a)
end

# Define subtraction (-) of residues
function -(x::Residue, y::Residue)
    return Residue(x.a - y.a)
end

# Define unary minus (-x) of residues
function -(x::Residue)
    return Residue(-x.a)
end

# Define multiplication (*) of residues
function *(x::Residue, y::Residue)
    return Residue(x.a * y.a)
end

# Define exponentiation (^) of residues
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

# Define inverse (inv) of residues
function inv(x::Residue)
    a, b, u, v = x.a, M, 1, 0
    while a ≠ 0
        q, r = divrem(b, a)
        u, v = v, u - q * v
        b, a = a, r
    end
    if b ≠ 1
        error("Residue is not invertible.")
    end
    return Residue(u)
end

# Define display of residues
function Base.display(x::Residue)
    return "$(x.a) mod $(M)"
end

x=Residue{Int,5}(12)
Base.display(x)