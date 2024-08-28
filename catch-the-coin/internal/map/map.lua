local sprites = require("internal/map/sprites")

local map = {
  sprite = {
    image = sprites.tile.image,
    quad = sprites.tile.quads[1],
  },
  width = sprites.width,
  height = sprites.height,
}

function map.draw()
  local h = sprites.tile.image:getHeight()
  local w = sprites.tile.image:getWidth()
  for i = 0, 800, w do
    for j = 0, 600, h do
      love.graphics.draw(map.sprite.image, map.sprite.quad, i, j)
    end
  end
end

return map
