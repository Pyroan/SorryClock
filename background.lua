require "spacemath"
require "constants"

Background = {
    rows = 40,
    cols = 100,
    spacing = 30,
    colors = {
        pink = colors["pink"],
        blue = colors["blue"]
    },
    loopTime = 10.0,
    timeSinceLastLoop = 0.0,
    rotation = tau / 20
}

function Background:draw()
    -- going for like a circle/halftone effect here
    local loopCompleteness = self.timeSinceLastLoop / self.loopTime
    local colorLerpAmount = (-math.cos(tau * loopCompleteness) + 1) / 2
    local oldColor = {love.graphics.getColor()}

    -- background
    love.graphics.clear(unpack(colorLerp(self.colors["blue"], self.colors["pink"], colorLerpAmount)))
    -- circles
    love.graphics.setColor(colorLerp(self.colors["pink"], self.colors["blue"], colorLerpAmount))
    for i = 1, self.cols do
        for j = 1, self.rows do
            local x = i * self.spacing
            -- offset every other row by half a space
            x = x + (j % 2) * (self.spacing / 2)
            -- offset by a column to make sure whole screen is filled
            x = x - self.spacing

            local y = j * self.spacing
            -- makes dots equidistant
            y = y * math.sqrt(0.75)
            -- makes dots move upward
            -- TODO make this a perfect loop
            y = y - (loopCompleteness * 100)
            -- offset by 12 rows to make sure whole screen is filled
            y = y - 12 * self.spacing

            -- rotation
            x, y = rotatePoint(x, y, self.rotation)

            local size = (math.cos(tau * loopCompleteness + j / self.rows)) * (self.spacing * .60)
            love.graphics.circle("fill", x, y, size)
        end
    end

    love.graphics.setColor(oldColor)
end

function Background:update(dt)
    self.timeSinceLastLoop = self.timeSinceLastLoop + dt
    if self.timeSinceLastLoop > self.loopTime then
        self.timeSinceLastLoop = self.timeSinceLastLoop - self.loopTime
    end
end
