using Plots

function mandelbrot(c; max_iter=1000)
    z = c
    for i in 1:max_iter
        if abs(z) > 2
            return i-1
        end
        z = z^2 + c
    end
    return max_iter
end

function mandelbrot_set(xmin=-2.0, xmax=1.0, ymin=-1.5, ymax=1.5; width=1000, height=1000, max_iter=256)
    img = Array{UInt16}(undef, height, width)
    for i in 1:width
        for j in 1:height
            x = xmin + i / width * (xmax - xmin)
            y = ymin + j / height * (ymax - ymin)
            c = x + y * im
            img[j, i] = mandelbrot(c, max_iter=max_iter)
        end
    end
    return img
end

img = mandelbrot_set()
heatmap(img, color=:grays, legend = false, axis = false)
savefig("mandelbrot.png")