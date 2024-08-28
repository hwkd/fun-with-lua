local player = require("internal/player/player")
local map = require("internal/map/map")
local coin = require("internal/coin/coin")

local windowHeight = 600
local windowWidth = 800

function love.load()
	love.window.setTitle("Catch the Coin")
	love.window.setMode(windowWidth, windowHeight)
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.update(dt)
	player.update(dt)
	coin.update(dt, { player = player })
end

function love.draw()
	map.draw()
	player.draw()
	coin.draw()
  -- Draw the score
  love.graphics.print("Score: " .. player.score, 10, 10)
end
