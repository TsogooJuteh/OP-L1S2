struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

function segment_intersection(s1::Segment2D, s2::Segment2D)
    x1, y1 = s1.p1.x, s1.p1.y
    x2, y2 = s1.p2.x, s1.p2.y
    x3, y3 = s2.p1.x, s2.p1.y
    x4, y4 = s2.p2.x, s2.p2.y

    denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1)
    
    if denom == 0
        return nothing  # lines are parallel or coincident
    end

    ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / denom
    ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / denom

    if 0 <= ua <= 1 && 0 <= ub <= 1
        x = x1 + ua * (x2 - x1)
        y = y1 + ua * (y2 - y1)
        return Vector2D(x, y)
    else
        return nothing  # segments do not intersect
    end
end

s1 = Segment2D(Vector2D(0.0, 0.0), Vector2D(2.0, 2.0))
s2 = Segment2D(Vector2D(2.0, 0.0), Vector2D(0.0, 2.0))

intersection = segment_intersection(s1, s2)

if intersection == nothing
    println("The segments do not intersect")
else
    println("The intersection point is ", intersection)
end
