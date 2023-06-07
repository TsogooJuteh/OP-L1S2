function multiply_matrix(A, B)
    result = [[0, 0], [0, 0]]
    for i in 1:2
        for j in 1:2
            for k in 1:2
                result[i][j] += A[i][k] * B[k][j]
            end
        end
    end
    return result
end

function power_matrix(F, n)
    M = [[1, 1], [1, 0]]
    for _ in 2:n
        M = multiply_matrix(M, F)
    end
    return M
end

function fibonacci(n)
    if n == 0
        return 0
    end
    F = [[1, 1], [1, 0]]
    F = power_matrix(F, n-1)
    return F[1][1]
end

println(fibonacci(10))
println(fibonacci(15))