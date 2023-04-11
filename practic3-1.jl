function checkingprime(a::T) where T
    if (a == 0 || a==1)
        return false
    end
    prime = 1
    i=2
    while (i<a)
        b=mod(a,i)
        if (b==0)
            prime = 0
            break
        end
        i=i+1
    end
    if (prime == 1)
        return true
    else 
        return false
    end
end

println(checkingprime(101))