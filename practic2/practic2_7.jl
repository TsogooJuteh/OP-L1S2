f(x) = cos(x) - x
df(x) = -sin(x) - 1

function newton_method(f, df, x0, epsilon = 1e-7, max_iter = 1000)
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

x0 = 1.0

root = newton_method(f, df, x0)

println("The approximate solution is: ", root)