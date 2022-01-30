--selfreq
-- Tick function that will be executed every logic tick

function onTick()
	--hosting
	if input.getBool(1) then
		output.setNumber(1, input.getNumber(1))
	end
	--TODO: bluetooth-like signal encryption by slightly changing the server code. requires an MP-friendly algorithm though.

	--connected as client
	if input.getBool(2) then
		output.setNumber(1, input.getNumber(2))
	end

	if not input.getBool(1) and not input.getBool(2) then
		output.setNumber(1, math.random(0, 9999))
	end

	--a = input.getBool(1) and not down
	--down = input.getBool(1)
	--if a then j = math.random(100,200) end
	--output.setNumber(1, j)
end