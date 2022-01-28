--memory
stored1=0
stored2=0
stored3=0
stored4=0
-- Tick function that will be executed every logic tick
function onTick()
	selfCode = input.getNumber(1)
	inputCode = input.getNumber(2)
	inputFreq = input.getNumber(3)
	selfF = input.getNumber(4)
	reset = input.getBool(1)
	
	if reset then
		stored1 = 0
		stored2 = 0
		stored3 = 0
		stored4 = 0
	end
	
	if inputCode == selfCode then
		if inputFreq ~= selfF then
			if stored1 == 0 then 
				stored1 = inputFreq 
			end
			if stored2 == 0 then 
				if inputFreq ~= stored1 then
					stored2 = inputFreq
				end
			end
			if stored3 == 0 then
				if inputFreq ~= stored2 and inputFreq ~= stored1 then
					stored3 = inputFreq
				end
			end
			if stored4 == 0 then 
				if inputFreq ~= stored3 and inputFreq ~= stored2 and inputFreq ~= stored1 then
					stored4 = inputFreq 
				end
			end
		end
	end
	
	output.setNumber(1, stored1)
	output.setNumber(2, stored2)
	output.setNumber(3, stored3)
	output.setNumber(4, stored4)
end

-- Draw function that will be executed when this script renders to stored1 screen
function onDraw()
	screen.drawText(1,1,stored1)
	screen.drawText(1,7,stored2)
	screen.drawText(1,14,stored3)
	screen.drawText(1,22,stored4)
end