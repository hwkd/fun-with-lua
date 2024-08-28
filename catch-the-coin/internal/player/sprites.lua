local itertools = require("pkg/itertools")
local spriteloader = require("pkg/spriteloader")

local sprites = {
  width = 20,
  height = 24,
	idle = {},
	walk = {},
}

local function rowQuadLoader(loader, from, to, row)
  return itertools.map(function(i)
    return loader(i, row)
  end, itertools.range(from, to))
end

local path = "assets/player/"

-- Idle
sprites.idle = spriteloader.newSpriteLoader(path .. "idle.png", 4, 4, sprites.width, sprites.height)

sprites.idle = {
	image = sprites.idle.image,
	quads = rowQuadLoader(sprites.idle.quadLoader, 1, 4, 3),
}

-- Walk
sprites.walk = spriteloader.newSpriteLoader(path .. "walk.png", 8, 4, sprites.width, sprites.height)

sprites.walk.right = {
	image = sprites.walk.image,
	quads = rowQuadLoader(sprites.walk.quadLoader, 1, 8, 1),
}

sprites.walk.left = {
	image = sprites.walk.image,
	quads = rowQuadLoader(sprites.walk.quadLoader, 1, 8, 2),
}

sprites.walk.down = {
	image = sprites.walk.image,
	quads = rowQuadLoader(sprites.walk.quadLoader, 1, 8, 3),
}

sprites.walk.up = {
	image = sprites.walk.image,
	quads = rowQuadLoader(sprites.walk.quadLoader, 1, 8, 4),
}

return sprites
