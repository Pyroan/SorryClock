tau = math.pi * 2

function Lerp(a, b, t)
    return ((1 - t) * a) + (t * b)
end

function colorLerp(color1, color2, t)
    local color = {}
    for i = 1, 4 do
        color[i] = Lerp(color1[i], color2[i], t)
    end
    return color
end

-- returns the point given by x, y rotated counterclockwise
-- around the origin by theta radians
function rotatePoint(x, y, theta)
    x = x * math.cos(theta) - y * math.sin(theta)
    y = x * math.sin(theta) + y * math.cos(theta)
    return x, y
end
