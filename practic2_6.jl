function newton_method(f, df, x0, epsilon, max_iter)
    x = x0
    for i in 1:max_iter
        x_old = x
        x -= f(x) / df(x)
        if abs(x - x_old) < epsilon
            return x
        end
    end
    return x
end

f(x) = x^3 - x^2 - 1
df(x) = 3x^2 - 2x
x0 = 1.0
epsilon = 0.0001
max_iter = 1000
println(newton_method(f, df, x0, epsilon, max_iter))
