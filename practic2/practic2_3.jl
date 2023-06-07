function log2(n::Int64)
    logValue = -1
    while (n > 0)
        logValue = logValue + 1
        n = div(n, 2)
    end
    return logValue
end

function log(a::Int64, b::Int64)
    return log2(b) / log2(a)
end

print(log(2, 8))

#It calculates log(b)_a
#log2 calculates log(n)_2