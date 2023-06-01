struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

import Base: +, *

function +(v1::Vector2D, v2::Vector2D)
    return Vector2D(v1.x + v2.x, v1.y + v2.y)
end

function *(a::Real, v::Vector2D)
    return Vector2D(a*v.x, a*v.y)
end

function length(s::Segment2D)
    dx = s.p2.x - s.p1.x
    dy = s.p2.y - s.p1.y
    return sqrt(dx^2 + dy^2)
end

v1 = Vector2D(1.0, 2.0)
v2 = Vector2D(3.0, 4.0)

v3 = v1 + v2
println("v1 + v2 = ", v3)

v4 = 2.0 * v1
println("2 * v1 = ", v4)

s = Segment2D(v1, v2)
println("length of segment s = ", length(s))