require "color"

local Config = love.filesystem.load("example.config.lua")()

theme = Config.theme

floatingText= Config.text;
fontSize = Config.fontSize;