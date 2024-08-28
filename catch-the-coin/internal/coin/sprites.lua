local spriteloader = require("pkg/spriteloader")

local sprites = {
  width = 70,
  height = 70,
	tile = {},
}

local path = "assets/coin/"

-- Idle
sprites.tile = spriteloader.newSpriteLoader(path .. "coin.png", 1, 1, sprites.width, sprites.height)
sprites.tile.quads = {
	sprites.tile.quadLoader(1, 1),
}
return sprites
