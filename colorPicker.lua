--colorpicker
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey
--- Remember to set your Author name etc. in the settings: CTRL+COMMA

require("_build._simulator_config") -- default simulator config, CTRL+CLICK it or F12 to goto this file and edit it. Its in a separate file just for convenience.
require("LifeBoatAPI")              -- Type 'LifeBoatAPI.' and use intellisense to checkout the new LifeBoatAPI library functions; such as the LBVec vector maths library

redToggled = false
pinkToggled = false
greenToggled = false
cyanToggled = false
blueToggled = false
yellowToggled = false

display = true
pickedColor = 0

function onTick()
	pressed = input.getBool(1) and not pulse
	pulse = input.getBool(1)

	touchX = input.getNumber(3)
	touchY = input.getNumber(4)

	if display then
		if (pressed and isInRect(58,30,10,9,touchX,touchY)) then
			redToggled = true
			pickedColor = 1
		end

		if (pressed and isInRect(73,30,10,9,touchX,touchY))then
			pinkToggled = true
			pickedColor = 2
		end

		if (pressed and isInRect(88,30,10,9,touchX,touchY)) then
			blueToggled = true
			pickedColor = 3
		end

		if (pressed and isInRect(59,44,9,9,touchX,touchY)) then
			cyanToggled = true
			pickedColor = 4
		end

		if (pressed and isInRect(73,44,10,9,touchX,touchY)) then
			yellowToggled = true
			pickedColor = 5
		end

		if (pressed and isInRect(88,44,9,9,touchX,touchY)) then
			greenToggled = true
			pickedColor = 6
		end

		if redToggled or pinkToggled or greenToggled or cyanToggled or blueToggled or yellowToggled then
			output.setBool(1, true)
			output.setNumber(1, pickedColor)
			display = false
		end
	else
		--idle
	end
end

function onDraw()
	if display then
		--background
		screen.setColor(30,30,30)
		screen.drawRectF(0,0,160,96)
		--main box
		screen.setColor(0,3,54)
		screen.drawRectF(54,18,48,39)

		screen.setColor(81,82,70)
		screen.drawTextBox(57, 18, 43, 11, "SenChat", 0, 0)
		
		screen.setColor(81,82,70)
		screen.drawTextBox(41, 69, 74, 14, "Set color", 0, 0)
		--red
		screen.setColor(96,0,0)
		screen.drawRectF(58,30,10,9)
		--pink
		screen.setColor(96,0,79)
		screen.drawRectF(73,30,10,9)
		--blue
		screen.setColor(0,96,1)
		screen.drawRectF(88,44,10,9)
		--cyan
		screen.setColor(0,96,95)
		screen.drawRectF(59,44,9,9)
		--yellow
		screen.setColor(0,3,96)
		screen.drawRectF(88,30,10,9)
		--green
		screen.setColor(96,80,0)
		screen.drawRectF(73,44,10,9)
	else
		--idle
	end
end

function isInRect(x,y,w,h,px,py)
	return px>=x and px<=x+w and py>=y and py<=y+h
end

