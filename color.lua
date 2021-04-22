-- convert color with r, g, b, a in  range 0-255 to 0-1
function color(r, g, b, a)
    a = a or 255

    return r / 255, g / 255, b / 255, a / 255
end
