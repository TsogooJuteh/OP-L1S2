function next_split!(s::AbstractVector{Integer}, k::Integer)
    k == 1 && return nothing
    i = k - 1
    while i > 1 && s[i - 1] == s[i]
        i -= 1
    end
    s[i] += 1
    r = sum(@view(s[i + 1: k]))
    k = i + r - 1
    s[i + 1:n - k] .= 1
    return s, k
end

n = 5
s = ones(Integer, n)
k = n
println(s)
while true
    println(s[1:k])
    global result = next_split!(s, k)
    if result === nothing  # Check for nothing explicitly
        break
    end
    global s, k = result
    println(s)
end
