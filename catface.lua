require "spacemath"
CatFace = {
    x = 0,
    y = 0,
    rotation = 0,
    timesincelastloop = 0.0,
    looplength = 5.0,
    colors = {{255 / 255, 229 / 255, 36 / 255, 1}, {245 / 255, 24 / 255, 241 / 255, 1}}
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
    offx = -math.sin(2 * math.pi * loopcompletion + offset) * 30 * 2
    offy = math.sin(4 * math.pi * loopcompletion + offset) * 30 -- / 2

    rot = -math.cos(2 * math.pi * loopcompletion + offset) * (math.pi / 40)

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
