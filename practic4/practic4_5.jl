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
    
    # Back substitution
    # x = zeros(n)
    # x[n] = b[n] / A[n,n]
    # for k = n-1:-1:1
    #     x[k] = (b[k] - dot(A[k,k+1:end], x[k+1:end])) / A[k,k]
    # end
    
    return A
end


A = [1 2 4 2; 3 5 2 11; 2 6 7 9]


println(gaussian_elimination(A))