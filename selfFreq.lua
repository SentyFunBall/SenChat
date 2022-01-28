--selfreq
-- Tick function that will be executed every logic tick
function onTick()
	a = input.getBool(1) and not down
	down = input.getBool(1)
	if a then j = math.random(100,200) end
	output.setNumber(1, j)
end