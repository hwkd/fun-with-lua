-- local function 

-- image = sprite sheet
-- nx = number of quads in x direction
-- ny = number of quads in y direction
-- width = width of each quad
-- height = height of each quad
local function newQuadLoader(image, nx, ny, width, height)
  local w = image:getWidth() / nx
  local h = image:getHeight() / ny

  local x = w / 2 - width / 2
  local y = h / 2 - height / 2

  local quads = {}

  for j = 1, ny do
    for i = 1, nx do
      quads[i + (j - 1) * nx] = love.graphics.newQuad(x + (i - 1) * w, y + (j - 1) * h, width, height, image)
    end
  end

  return function(i, j)
    return quads[i + (j - 1) * nx]
  end
end

-- path = path to the sprite sheet
-- nx = number of quads in x direction
-- ny = number of quads in y direction
-- xPadding = padding between quads in x direction
-- yPadding = padding between quads in y direction
-- width = width of each quad
-- height = height of each quad
local function newSpriteLoader(path, nx, ny, width, height)
	local image = love.graphics.newImage(path)
	return {
    image = image,
    quadLoader = newQuadLoader(image, nx, ny, width, height)
  }
end

return {
	newSpriteLoader = newSpriteLoader,
	newQuadLoader = newQuadLoader,
}
