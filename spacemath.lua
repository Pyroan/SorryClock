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
