function meanstd(aaa)
    T = eltype(aaa)
    n = 0
    s¹ = zero(T)
    s² = zero(T)
    for a in aaa
        n += 1
        s¹ += a
        s² += a*a
    end
    mean = s¹ / n
    return mean, sqrt(s²/n - mean*mean)
end

data = [1.0, 2.0, 3.0, 4.0, 5.0]
mean_val, std_val = meanstd(data)
println(mean_val)
println(std_val)