require "spacemath"

Background = {
    rows = 40,
    cols = 100,
    spacing = 30,
    colors = {
        pink = {224 / 255, 16 / 255, 214 / 255, 1},
        blue = {24 / 255, 201 / 255, 245 / 255, 1}
    },
    looptime = 10.0,
    timesincelastloop = 0.0,
    rotation = math.pi / 10
}

function Background:draw()
    loopcompleteness = self.timesincelastloop / self.looptime
    -- going for like a circle/halftone effect here
    love.graphics.clear(unpack(colorLerp(self.colors["blue"], self.colors["pink"],
                                   (-math.cos(math.pi * 2 * loopcompleteness) + 1) / 2)))
    oldcolor = {love.graphics.getColor()}
    love.graphics.setColor(colorLerp(self.colors["pink"], self.colors["blue"],
                               (-math.cos(math.pi * 2 * loopcompleteness) + 1) / 2))
    for i = 1, self.cols do
        for j = 1, self.rows do
            x = (i * self.spacing) + ((j % 2 * self.spacing) / 2 - self.spacing)
            y = (j * self.spacing) * math.sqrt(0.75) - (self.timesincelastloop * 10) - 12 * self.spacing

            -- rotation
            x = x * math.cos(self.rotation) - y * math.sin(self.rotation)
            y = x * math.sin(self.rotation) + y * math.cos(self.rotation)

            size = (math.cos(2 * math.pi * loopcompleteness + j / self.rows)) * (self.spacing * .60)
            love.graphics.circle("fill", x, y, size)
        end
    end

    love.graphics.setColor(oldcolor)
end

function Background:update(dt)
    self.timesincelastloop = self.timesincelastloop + dt
    if self.timesincelastloop > self.looptime then
        self.timesincelastloop = self.timesincelastloop - self.looptime
    end
end
