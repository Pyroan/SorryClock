require "spacemath"
require "constants"
CatFace = {
    x = 0,
    y = 0,
    rotation = 0,
    maxAngle = tau / 80,
    timeSinceLastLoop = 0.0,
    loopLength = 5.0,
    colors = {colors["gold"], colors["pink"]}
}

function CatFace:inittext()
    local font = love.graphics.newFont("ARCADE_N.TTF", 64)
    self.text = love.graphics.newText(font, floatingText)
end

function CatFace:draw()
    -- love.graphics.print("x: " .. self.x .. "\ny: " .. self.y)
    local oldColor = {love.graphics.getColor()}
    for i = 1, 20 do
        self:drawLayer(i / 20)
    end
    love.graphics.setColor(oldColor)
end

function CatFace:drawLayer(offset)
    -- infinity-sign loop
    local loopCompletion = self.timeSinceLastLoop / self.loopLength
    local t = tau * loopCompletion + offset
    local offX = -math.sin(t) * 30 * 2
    local offY = math.sin(2 * t) * 30 -- / 2

    local w, h = love.window.getMode()
    self.x = (w / 2) + offX
    self.y = (h / 2) + offY
    self.rotation = -math.cos(t) * self.maxAngle

    love.graphics.setColor(colorLerp(self.colors[1], self.colors[2], 1 - offset))

    local tw, th = self.text.getDimensions(self.text)
    love.graphics.draw(self.text, self.x, self.y, self.rotation, 1, 1, tw / 2, th / 2)
end

function CatFace:update(dt)

    self.timeSinceLastLoop = self.timeSinceLastLoop + dt
    if self.timeSinceLastLoop > self.loopLength then
        self.timeSinceLastLoop = self.timeSinceLastLoop - self.loopLength
    end

end
