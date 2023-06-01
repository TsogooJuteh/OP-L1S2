struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function is_convex(polygon::Array{Vector2D, 1})
    n = length(polygon)
    if n < 3
        return false  # not a polygon
    end

    sign = 0
    for i in 1:n
        p1 = polygon[i]
        p2 = polygon[mod1(i+1, n)]
        p3 = polygon[mod1(i+2, n)]
        dx1 = p2.x - p1.x
        dy1 = p2.y - p1.y
        dx2 = p3.x - p2.x
        dy2 = p3.y - p2.y
        cross = dx1 * dy2 - dy1 * dx2

        if cross != 0
            if sign == 0
                sign = cross
            elseif sign * cross < 0
                return false  # polygon is not convex
            end
        end
    end

    return true  # polygon is convex
end

polygon = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(1.0, 2.0)]
println("The polygon is convex: ", is_convex(polygon))

polygon = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(1.0, 2.0), Vector2D(0.0, 2.0)]
println("The polygon is convex: ", is_convex(polygon))
