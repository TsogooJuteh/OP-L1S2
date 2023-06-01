using LinearAlgebra
function gaussian_elimination(A)
    n = size(A, 1)
    
    # Forward elimination
    for k = 1:n-1
        for i = k+1:n
            factor = A[i,k] / A[k,k]
            A[i,k:end] -= factor * A[k,k:end]
        end
    end
    
    #Back substitution
    
    return A
end




A = rand(Float64, (1000, 1000))
@time gaussian_elimination(A)
#println(A)
#println(gaussian_elimination(A))