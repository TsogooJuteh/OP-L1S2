struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function polygon_area(polygon::Array{Vector2D, 1})
    n = length(polygon)
    area = 0.0

    for i in 1:n
        p1 = polygon[i]
        p2 = polygon[mod1(i+1, n)]
        area += (p1.x * p2.y - p2.x * p1.y)
    end

    return area / 2
end

polygon = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(2.0, 2.0), Vector2D(0.0, 2.0)]
println("The area of the polygon is: ", polygon_area(polygon))
