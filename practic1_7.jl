struct Residue{T, M}
    a::T
    Residue{T, M}(a) where {T, M} = new(mod(a, M))
end

struct Polynomial{T}
    coeffs::Vector{T}
end

import Base: +, -, *, ^, -, inv, show

+(x::Residue{T, M}, y::Residue{T, M}) where {T, M} = Residue{T, M}(x.a + y.a)
-(x::Residue{T, M}, y::Residue{T, M}) where {T, M} = Residue{T, M}(x.a - y.a)
-(x::Residue{T, M}) where {T, M} = Residue{T, M}(-x.a)
*(x::Residue{T, M}, y::Residue{T, M}) where {T, M} = Residue{T, M}(x.a * y.a)
^(x::Residue{T, M}, n::Integer) where {T, M} = Residue{T, M}(x.a ^ n)
inv(x::Residue{T, M}) where {T, M} = Residue{T, M}(invmod(x.a, M))

show(io::IO, x::Residue) = print(io, x.a)

p1 = Polynomial([Residue{Int, 7}(1), Residue{Int, 7}(2), Residue{Int, 7}(3)])
println("p1 = ", p1)
