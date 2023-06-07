struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

angle(y::Float64, x::Float64) = atan(y, x)

function graham_scan(points::Array{Vector2D, 1})
    pivot = points[1]
    for p in points
        if p.y < pivot.y || (p.y == pivot.y && p.x < pivot.x)
            pivot = p
        end
    end
    sort!(points, by=p->angle(p.y - pivot.y, p.x - pivot.x))

    stack = [pivot, points[1]]
    
    for p in points[2:end]
        while length(stack) > 1 && cross_product(stack[end-1], stack[end], p) <= 0
            pop!(stack)
        end
        push!(stack, p)
    end

    return stack
end

function cross_product(p1::Vector2D, p2::Vector2D, p3::Vector2D)
    return (p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x)
end

points = [Vector2D(0.0, 0.0), Vector2D(2.0, 0.0), Vector2D(1.0, 2.0), Vector2D(2.0, 2.0), Vector2D(0.0, 2.0), Vector2D(1.0, 1.0)]
hull = graham_scan(points)
println("The points of the convex hull are: ")
for p in hull
    println("(", p.x, ", ", p.y, ")")
end
