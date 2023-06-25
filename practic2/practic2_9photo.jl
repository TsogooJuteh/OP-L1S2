using Symbolics
using Plots

f(x) = x^3 - 1;

function get_map(f)
    # define variable
    @variables x
    # define derivative operator
    Dx = Differential(x)
    map = x - f(x) / Dx(f(x)) |> expand_derivatives
    # now we expand and compile to a Julia function
    update_expr = build_function(map, x)
    return eval(update_expr)
end

update = get_map(f)
#print(update(2.0))

function applyiteratively(x, update; n=100)
    for i in 1:n
        x = update(x)
    end
    return x
end

# print(applyiteratively(2.0, update))  # apply 100 times
# print(applyiteratively(-2.0 - 2.0im, update))

lower = -2 - 2im
upper = 2 + 2im

step = 0.5e-2

# generate a range of complex values
Z0 = [a+b*im for b in real(lower):step:real(upper),
                    a in imag(lower):step:imag(upper)]

# apply the update 100 times
Z100 = applyiteratively.(Z0, update);

p = heatmap(angle.(Z100), colorbar=false, color=:rainbow, ticks=false)
savefig(p, "heatmap.png")
