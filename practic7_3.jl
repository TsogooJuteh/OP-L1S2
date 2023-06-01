indicator(i::Integer, n::Integer) = digits(Bool, i; base = 2, pad = n)

function next_indicator!(indicator::AbstractVector{Bool})
    i = findlast(x->(x == 0), indicator)
    isnothing(i) && return nothing
    indicator[i] = 1
    indicator[i + 1:end] .= 0
    return indicator
end

n = 5
A = 1:n
global ind = zeros(Bool, n)
while !isnothing(ind)
    A[findall(ind)] |> println
    global ind = next_indicator!(ind)
    println(ind)
end
