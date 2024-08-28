local sprites = require("internal/player/sprites")

local windowWidth, windowHeight = love.graphics.getDimensions()
local scale = 3
local player = {
	_x = 0,
	_y = 0,
	x = windowWidth / 2 - sprites.width*scale/2,
	y = windowHeight / 2 - sprites.height*scale/2,
  score = 0,
	sprite = sprites.idle.down,
	speed = 5,
  scale = scale,
  width = sprites.width*scale,
  height = sprites.height*scale,
}

function player.collided(object)
  player.score = player.score + 1
end

function player.movement()
  local dx = 0
  local dy = 0

  if love.keyboard.isDown("right") then
    dx = player.speed
    player.sprite = sprites.walk.right
  end

  if love.keyboard.isDown("left") then
    dx = -player.speed
    player.sprite = sprites.walk.left
  end

  if love.keyboard.isDown("down") then
    dy = player.speed
    player.sprite = sprites.walk.down
  end

  if love.keyboard.isDown("up") then
    dy = -player.speed
    player.sprite = sprites.walk.up
  end

  player._x = player.x
  player._y = player.y

  player.x = player.x + dx
  player.y = player.y + dy

  return dx ~= 0 or dy ~= 0, {dx, dy}
end

function player.update(dt)
  local isMoving, _ = player.movement()
	if not isMoving then
		player.sprite = sprites.idle
	end

	local time = love.timer.getTime()
  local idx = 1
	if player.sprite == sprites.walk then
		idx = math.floor(time * 4 % 4) + 1
	else
		idx = math.floor(time * 4 % 4) + 1
	end
	player.sprite.quad = player.sprite.quads[idx]
end

function player.draw()
	love.graphics.draw(player.sprite.image, player.sprite.quad, player.x, player.y, 0, 3, 3, 0, 0)
end

return player
