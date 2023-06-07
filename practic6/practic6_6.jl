struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function point_in_circle(p::Vector2D, center::Vector2D, radius::Float64)
    dx = p.x - center.x
    dy = p.y - center.y
    return dx*dx + dy*dy <= radius*radius
end

center = Vector2D(0.0, 0.0)
radius = 1.0

p = Vector2D(0.5, 0.5)
println("p is inside the circle: ", point_in_circle(p, center, radius))

p = Vector2D(2.0, 2.0)
println("p is inside the circle: ", point_in_circle(p, center, radius))
