struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function point_in_polygon(p::Vector2D, polygon::Array{Vector2D, 1})
    count = 0
    n = length(polygon)
    for i in 1:n
        p1 = polygon[i]
        p2 = polygon[mod1(i+1, n)]
        
        # Check if point lies on the vertex
        if p1 == p || p2 == p
            return true
        end

        if ((p1.y > p.y) != (p2.y > p.y)) && (p.x < (p2.x - p1.x) * (p.y - p1.y) / (p2.y - p1.y) + p1.x)
            count += 1
        end
    end
    return count % 2 == 1
end

polygon = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(1.0, 2.0)]

p = Vector2D(1.0, 1.0)  # inside the polygon
println("p is inside the polygon: ", point_in_polygon(p, polygon))

p = Vector2D(2.0, 2.0)  # outside the polygon
println("p is inside the polygon: ", point_in_polygon(p, polygon))
