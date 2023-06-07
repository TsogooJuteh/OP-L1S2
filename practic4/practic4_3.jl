using SpecialFunctions
using Plots

function besselj_recur(n::Int, x::Float64)
    if n == 0
        return besselj0(x)
    elseif n == 1
        return besselj1(x)
    else
        return 2*(n-1)/x * besselj_recur(n-1, x) - besselj_recur(n-2, x)
    end
end

x_values = 0:0.1:10  
n_values = 0:3       

p = plot()

for n in n_values
    y_values = besselj_recur.(n, x_values)
    plot!(p, x_values, y_values, label="n=$n")
end

display(p)
