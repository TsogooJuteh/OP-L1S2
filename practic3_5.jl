function is_leaf(node)
    return isa(node, Int)
end

function nested_to_adjlist(tree, parent=0, adjlist=Dict{Int, Vector{Union{Int, Nothing}}}())
    if is_leaf(tree)
        if !haskey(adjlist, parent)
            adjlist[parent] = []
        end
        push!(adjlist[parent], tree)
    else
        for child in tree
            nested_to_adjlist(child, tree[1], adjlist)
        end
    end
    return adjlist
end

function nested_to_relatedstruct(tree, parent=0, relatedstruct=Vector{Tuple{Int, Union{Int, Nothing}}}())
    if is_leaf(tree)
        push!(relatedstruct, (tree, parent))
    else
        for child in tree
            nested_to_relatedstruct(child, tree[1], relatedstruct)
        end
    end
    return relatedstruct
end

function adjlist_to_nested(adjlist, root)
    tree = []
    if haskey(adjlist, root)
        for child in adjlist[root]
            append!(tree, adjlist_to_nested(adjlist, child))
        end
    else
        return root
    end
    return tree
end

function adjlist_to_relatedstruct(adjlist)
    relatedstruct = []
    for (parent, children) in adjlist
        for child in children
            push!(relatedstruct, (child, parent))
        end
    end
    return relatedstruct
end

function relatedstruct_to_nested(relatedstruct, root=0)
    children = [v for (v, p) in relatedstruct if p == root]
    if isempty(children)
        return root
    else
        return [relatedstruct_to_nested(relatedstruct, child) for child in children]
    end
end

function relatedstruct_to_adjlist(relatedstruct)
    adjlist = Dict{Int, Vector{Union{Int, Nothing}}}()
    for (vertex, parent) in relatedstruct
        if !haskey(adjlist, parent)
            adjlist[parent] = []
        end
        push!(adjlist[parent], vertex)
    end
    return adjlist
end

nested = [1, [2, 5], 3, [4, 6, 7]]
adjlist = Dict{Int, Vector{Union{Int, Nothing}}}()
adjlist[1] = [2, 3, 4]
adjlist[2] = [5]
adjlist[3] = [6]
adjlist[4] = [7]
relatedstruct = [(2, 1), (3, 1), (4, 1), (5, 2), (6, 3), (7, 4)]
println("Nested to AdjList: ", nested_to_adjlist(nested))
println("Nested to RelatedStruct: ", nested_to_relatedstruct(nested))
println("AdjList to Nested: ", adjlist_to_nested(adjlist, 1))
println("AdjList to RelatedStruct: ", adjlist_to_relatedstruct(adjlist))
println("RelatedStruct to Nested: ", relatedstruct_to_nested(relatedstruct, 1))
println("RelatedStruct to AdjList: ", relatedstruct_to_adjlist(relatedstruct))