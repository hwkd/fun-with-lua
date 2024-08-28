local spriteloader = require("pkg/spriteloader")

local sprites = {
  width = 128,
  height = 128,
	tile = {},
}

local path = "assets/map/"

-- Idle
sprites.tile = spriteloader.newSpriteLoader(path .. "tile.png", 1, 1, sprites.width, sprites.height)
sprites.tile.quads = {
	sprites.tile.quadLoader(1, 1),
}
return sprites
