local sprites = require("internal/coin/sprites")
local physics = require("pkg/physics")

local scale = 0.5
local coin = {
	sprite = {
		image = sprites.tile.image,
		quad = sprites.tile.quads[1],
	},
	x = 0,
	y = 0,
	width = sprites.width * scale,
	height = sprites.height * scale,
}

local windowWidth, windowHeight = love.graphics.getDimensions()

function coin.update(dt, objects)
	if physics.collided(objects.player, coin) then
    objects.player.collided(coin)
		coin.x = math.random(0, windowWidth - coin.width)
		coin.y = math.random(0, windowHeight - coin.height)
	end
end

function coin.draw()
	love.graphics.draw(coin.sprite.image, coin.sprite.quad, coin.x, coin.y, 0, scale, scale)
end

return coin
