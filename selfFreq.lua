--selfreq
-- Tick function that will be executed every logic tick

function onTick()
	if input.getBool(1) then
		output.setNumber(1, input.getNumber(1))
	else
		output.setNumber(1, math.random(100, 999))
	end
	--a = input.getBool(1) and not down
	--down = input.getBool(1)
	--if a then j = math.random(100,200) end
	--output.setNumber(1, j)
end