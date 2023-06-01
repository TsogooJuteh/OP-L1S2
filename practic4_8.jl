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
    
    count = 0
    for i = 1:n
        check = zeros(t, 0)
        if A[i, 1:end] != check[1, 1:end]
            count = count + 1
        end
    end
    # Back substitution
    # x = zeros(n)
    # x[n] = b[n] / A[n,n]
    # for k = n-1:-1:1
    #     x[k] = (b[k] - dot(A[k,k+1:end], x[k+1:end])) / A[k,k]
    # end
    
    return count
end


A = [1.0 2.0 4.0 2.0; 3.0 5.0 2.0 11.0; 2.0 6.0 7.0 9.0]


println(gaussian_elimination(A))