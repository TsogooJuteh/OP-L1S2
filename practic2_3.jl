function log_base_a(x, a, epsilon)
    log_x = log(x)
    log_a = log(a)
    log_ax = log_x / log_a
    log_ax = round(log_ax, digits=epsilon)
    return log_ax
end

a = 2
x = 8
epsilon = 5
println(log_base_a(x, a, epsilon))
