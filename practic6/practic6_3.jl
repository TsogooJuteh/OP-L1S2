struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function F(x, y)
    #curve equation
    return y - x^2
end

function same_side_curve(p1::Vector2D, p2::Vector2D)
    val1 = F(p1.x, p1.y)
    val2 = F(p2.x, p2.y)
    
    return val1 * val2 >= 0
end

p1 = Vector2D(1.0, 2.0)
p2 = Vector2D(2.0, 1.0)

println("p1 and p2 are on the same side of the curve: ", same_side_curve(p1, p2))