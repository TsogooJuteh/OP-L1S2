struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function signed_distance(p::Vector2D, s::Segment2D)
    #vector to the line
    dx = s.p2.x - s.p1.x
    dy = s.p2.y - s.p1.y
    normal = Vector2D(-dy, dx)
    
    #vector from p1 to p
    v = Vector2D(p.x - s.p1.x, p.y - s.p1.y)
    
    #dot of v and vector(line)
    dot_product = v.x*normal.x + v.y*normal.y
    
    return dot_product
end

function same_side(p1::Vector2D, p2::Vector2D, s::Segment2D)
    d1 = signed_distance(p1, s)
    d2 = signed_distance(p2, s)
    
    return d1*d2 >= 0
end

s = Segment2D(Vector2D(0.0, 0.0), Vector2D(1.0, 1.0))

p1 = Vector2D(1.0, 2.0)
p2 = Vector2D(2.0, 3.0)

println("p1 and p2 are on the same side of s: ", same_side(p1, p2, s))