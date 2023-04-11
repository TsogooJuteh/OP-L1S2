function multiply(arr1, arr2)
    x = arr1[1, 1] * arr2[1, 1] + arr1[1, 2] * arr2[2, 1]
    y = arr1[1, 1] * arr2[1, 2] + arr1[1, 2] * arr2[2, 2]
    z = arr1[2, 1] * arr2[1, 1] + arr1[2, 2] * arr2[2, 1]
    t = arr1[2, 1] * arr2[1, 2] + arr1[2, 2] * arr2[2, 2]
    #println(x)
    arr1[1, 1] = x
    arr1[1, 2] = y
    arr1[2, 1] = z
    arr1[2, 2] = t
    #println(x)
end

function fib(n::Int64, arr1, arr2)
    while (n > 0)
        if (n % 2 != 0)
            multiply(arr1, arr2)
        end
        n = div(n, 2)
        if (n == 0)
            continue
        end
        multiply(arr1, arr1)
    end
    return arr1[1, 1]
end


n = 9
arr1 = [1 1
        1 0]
arr2 = [1 1
        1 0]
#print(arr1[2, 1])
print(fib(n-2, arr1, arr2))