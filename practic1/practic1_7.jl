struct Residue{T,M}
    a::T
    Residue{T,M}(a) where {T,M} = new(mod(a,M))
end

struct Polynomial{T}
    coeffs::Vector{T}
end

# Define arithmetic operations for Residue/ Определять арифметическике операции для Residue
import Base: +, -, *, /

+(x::Residue{T,M}, y::Residue{T,M}) where {T,M} = Residue{T,M}(x.a + y.a)
-(x::Residue{T,M}, y::Residue{T,M}) where {T,M} = Residue{T,M}(x.a - y.a)

# Define arithmetic operations for Polynomial with coefficients as Residue/ Определять арифметическике операции для Polynomial с коэффициентами из Residue

+(p::Polynomial{T}, q::Polynomial{T}) where T = Polynomial(map(+, p.coeffs, q.coeffs))
-(p::Polynomial{T}, q::Polynomial{T}) where T = Polynomial(map(-, p.coeffs, q.coeffs))

R1 = Residue{Int, 7}(11)   # This should create a Residue object with value 4/ Это должно создать объект остатка со значением 4 (11 mod 7)
R2 = Residue{Int, 7}(5)    # This should create a Residue object with value 5

println(R1.a)  # Should print 4/ принт 4
println(R2.a)  # Should print 5

R3 = R1 + R2   # Should result in a Residue object with value 1/ Должен привести к получению остаточного объекта со значением 1 (4 + 5 = 9, 9 mod 7 = 2)

println(R3.a)  # Should print 1

P1 = Polynomial([R1, R2]) # Creates a Polynomial with Residues as coefficients/ Создает "Polynomial" с "Residue" в качестве коэффициентов
P2 = Polynomial([R1, R2]) # Creates another Polynomial with Residues as coefficients/ ещё другой

P3 = P1 + P2  # Adds the polynomials

# Should print a polynomial with coefficients [1, 3] (because 4+4=8, 8 mod 7 = 1; 5+5 = 10, 10 mod 7 = 3)
println([coeff.a for coeff in P3.coeffs]) 