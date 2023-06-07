indicator_func(i::Integer, n::Integer) = digits(Bool, i; base = 2, pad = n)

function next_indicator!(indicator::AbstractVector{Bool}, k)
    i = lastindex(indicator)
    while indicator[i] == 0
        i -= 1
    end
    m = 0
    while i >= firstindex(indicator) && indicator[i] == 1
        m += 1
        i -= 1
    end
    if i < firstindex(indicator)
        return nothing
    end
    indicator[i] = 1
    indicator[i + 1:i + m - 1] .= 0
    indicator[i + m:end] .= 1
    return indicator
end

n = 6
k = 3
A = 1:n
global indicator_var = [zeros(Bool, n - k); ones(Bool, k)]
A[findall(indicator_var)] |> println
while indicator_var !== nothing
    global indicator_var = next_indicator!(indicator_var, k)
    isnothing(indicator_var) && break
    A[findall(indicator_var)] |> println
end
