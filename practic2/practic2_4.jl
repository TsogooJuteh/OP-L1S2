function bisection(f, a, b, epsilon)
    c = a
    if f(a) * f(b) >= 0
        println("not applicable.")
        return
    end
    while ((b - a) >= epsilon)
        c = (a + b) / 2
        if f(c) == 0.0
            break
        elseif f(c) * f(a) < 0
            b = c
        else
            a = c
        end
    end
    return c
end

f(x) = x^2 - 4
a = 1.0 
b = 3.0 
epsilon = 0.01
println(bisection(f, a, b, epsilon))
