
Theme = {
    bgPrimary = {},
    bgSecondary = {},
    textPrimary = {},
    textSecondary = {}
}

function Theme:newTheme(bgPrimary, bgSecondary, textPrimary,textSecondary)
    o = {}
    o.bgPrimary = bgPrimary
    o.bgSecondary = bgSecondary
    o.textPrimary = textPrimary
    o.textSecondary = textSecondary
    setmetatable(o, self)
    self.__index = self
    return o
end

themes = {
    default = Theme:newTheme(
        {color(24, 201, 245)},
        {color(224, 16, 214)},
        {color(255, 229, 36)},
        {color(224, 16, 214)}
    ),
    ghost = Theme:newTheme(
        {color(0, 0, 0)},
        {color(0, 0, 0)},
        {color(0, 0, 0)},
        {color(255, 255, 255)}
    )
}