function is_leaf(node)
    return isa(node, Int)
end

function height(tree)
    if is_leaf(tree)
        return 0
    else
        return 1 + maximum(height(child) for child in tree)
    end
end

function count_leaves(tree)
    if is_leaf(tree)
        return 1
    else
        return sum(count_leaves(child) for child in tree)
    end
end

function count_vertices(tree)
    if is_leaf(tree)
        return 1
    else
        return 1 + sum(count_vertices(child) for child in tree)
    end
end

function max_valence(tree)
    if is_leaf(tree)
        return 0
    else
        return max(length(tree), maximum(max_valence(child) for child in tree))
    end
end

function sum_depths(tree, depth=0)
    if is_leaf(tree)
        return depth
    else
        return sum(sum_depths(child, depth+1) for child in tree)
    end
end

function average_path_length(tree)
    return sum_depths(tree) / count_vertices(tree)
end

tree = [5, [3, [2, 4]], 7, [1, 6, [8, 9]]]

println("Height: ", height(tree))
println("Leaf Count: ", count_leaves(tree))
println("Vertex Count: ", count_vertices(tree))
println("Max Valence: ", max_valence(tree))
println("Average Path Length: ", average_path_length(tree))