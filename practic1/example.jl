struct Residue{T, M}
    a::T
    Residue{T,M}(a) where {T, M} = new(mod(a, M))
end

import Base: +, -, *

+(x::Residue{T, M}, y::Residue{T, M}) where {T, M} =  Residue{T, M}(x.a + y.a)

x = Residue{Int, 7}(5)
y = Residue{Int, 7}(6)

println(x+y)