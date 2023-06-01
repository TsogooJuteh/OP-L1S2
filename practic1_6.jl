struct Polynomial{T}
    coeffs::Vector{T}
end

function Polynomial(coeffs::Vector{T}) where T
    while !isempty(coeffs) && coeffs[end] == zero(T)
        pop!(coeffs)
    end
    return Polynomial{T}(coeffs)
end

#p = Polynomial([1, 2, 3])

#println(p)

p1 = Polynomial([1, 2, 3])
println("p1 = ", p1)

p2 = Polynomial([0, 0, 0, 4, 5])
println("p2 = ", p2)

p3 = Polynomial([0, 0])
println("p3 = ", p3)

p4 = Polynomial([])
println("p4 = ", p4)
