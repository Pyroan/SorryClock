require "color"

local Config = love.filesystem.load("config.lua")()

colors = {
    pink = Config.dotColor,
    blue = Config.backgroundColor,
    gold = Config.textPrimaryColor,
}

floatingText= Config.text;
