function power(a,b)
    result = 1
    while !iszero(b)
        if (b%2!=0)
            result=result*a
        end
        a=a*a
        b=div(b,2)
    end
    return result
end

println(power(7,8))