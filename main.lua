require "catface"
require "background"

function love.load()
    love.window.setMode(1000, 400)
    CatFace:inittext()
end

function love.draw()
    -- Draw Background
    Background:draw()
    CatFace:draw()
    -- love.graphics.print("Hello World", 400, 300)
end

function love.update(dt)
    Background:update(dt)
    CatFace:update(dt)
end
