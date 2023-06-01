using LinearAlgebra
function gaussian_elimination(A)
    n = size(A, 1)
    t = size(A, 2)
    println(t)
    # Forward elimination
    for k = 1:n-1
        for i = k+1:n
            factor = A[i,k] / A[k,k]
            A[i,k:end] -= factor * A[k,k:end]
            
        end
    end
    
    det = 1
    for i = 1:n
       det = det * A[i, i]
    end
    # Back substitution
    # x = zeros(n)
    # x[n] = b[n] / A[n,n]
    # for k = n-1:-1:1
    #     x[k] = (b[k] - dot(A[k,k+1:end], x[k+1:end])) / A[k,k]
    # end
    
    return det
end

A = [1 2 4 ; 3 5 2 ; 2 6 7]

println(gaussian_elimination(A))
println(A)