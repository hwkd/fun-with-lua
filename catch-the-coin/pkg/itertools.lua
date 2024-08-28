local function map(fn, list)
	local newlist = {}
	for i, x in ipairs(list) do
		newlist[i] = fn(x)
	end
	return newlist
end

local function filter(fn, list)
	local newlist = {}
	for _, x in ipairs(list) do
		if fn(x) then
			newlist[#newlist+1] = x
		end
		return newlist
  end
end

local function range(from, to)
  local list = {}
  for i = from, to do
    list[#list+1] = i
  end
  return list
end

return {
  map = map,
  filter = filter,
  range = range,
}
