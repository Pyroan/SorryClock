require "spacemath"
require "constants"
CatFace = {
    x = 0,
    y = 0,
    rotation = 0,
    timesincelastloop = 0.0,
    looplength = 5.0,
    colors = {colors["gold"], colors["pink"]}
}

function CatFace:inittext()
    local font = love.graphics.newFont("ARCADE_N.TTF", 64)
    self.text = love.graphics.newText(font, "Just Walk Out")
end

function CatFace:draw()
    -- love.graphics.print("x: " .. self.x .. "\ny: " .. self.y)
    oldcolor = {love.graphics.getColor()}
    for i = 1, 20 do
        self:drawLayer(i / 20)
    end
    love.graphics.setColor(oldcolor)
end

function CatFace:drawLayer(offset)
    -- infinity-sign loop
    loopcompletion = self.timesincelastloop / self.looplength
    offx = -math.sin(tau * loopcompletion + offset) * 30 * 2
    offy = math.sin(2 * tau * loopcompletion + offset) * 30 -- / 2

    rot = -math.cos(tau * loopcompletion + offset) * (tau / 80)

    w, h = love.window.getMode()
    self.x = (w / 2) + offx
    self.y = (h / 2) + offy
    self.rotation = rot

    love.graphics.setColor(colorLerp(self.colors[1], self.colors[2], 1 - offset))

    tw, th = self.text.getDimensions(self.text)
    love.graphics.draw(self.text, self.x, self.y, self.rotation, 1, 1, tw / 2, th / 2)
end

function CatFace:update(dt)

    self.timesincelastloop = self.timesincelastloop + dt
    if self.timesincelastloop > self.looplength then
        self.timesincelastloop = self.timesincelastloop - self.looplength
    end

end
