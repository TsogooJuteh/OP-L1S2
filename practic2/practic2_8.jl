function polynomial_value(coeffs::Vector{Float64}, x::Float64)
    return sum([coeffs[i]*x^(i-1) for i in 1:length(coeffs)])
end

function polynomial_derivative_value(coeffs::Vector{Float64}, x::Float64)
    return sum([(i)*coeffs[i+1]*x^(i-1) for i in 1:(length(coeffs)-1)])
end

function newton_method(coeffs::Vector{Float64}, x0::Float64)
    EPSILON = 1e-6
    x = x0
    while abs(polynomial_value(coeffs, x)) > EPSILON
        x = x - polynomial_value(coeffs, x) / polynomial_derivative_value(coeffs, x)
    end
    return x
end

coeffs = [1.0, -2.0, 0.0, -1.0]
x0 = 1.0
root = newton_method(coeffs, x0)
println("Approximate root: ", root)
