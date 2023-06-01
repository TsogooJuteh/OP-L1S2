struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function polygon_area_triangle_method(polygon::Array{Vector2D, 1})
    n = length(polygon)
    if n < 3
        return 0  # not a polygon
    end

    area = 0.0
    p1 = polygon[1]
    for i in 2:n-1
        p2 = polygon[i]
        p3 = polygon[i+1]
        area += (p2.x - p1.x) * (p3.y - p1.y) - (p3.x - p1.x) * (p2.y - p1.y)
    end

    return area / 2
end

polygon = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(2.0, 2.0), Vector2D(0.0, 2.0)]
println("The area of the polygon is: ", polygon_area_triangle_method(polygon))