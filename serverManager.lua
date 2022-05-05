--servermanager

require("_build._simulator_config")
require("LifeBoatAPI")
--local std = require("STDebugger")

--LBs stupid buttons
-- color palette, keeping them here makes UI easier to restyle
color_Highlight = LifeBoatAPI.LBColorRGBA:lbcolorrgba_newGammaCorrected(230, 230, 230)   -- offwhite
color_Inactive  = LifeBoatAPI.LBColorRGBA:lbcolorrgba_newGammaCorrected(100,100,100)     -- grey
color_Active    = LifeBoatAPI.LBColorRGBA:lbcolorrgba_newGammaCorrected(200,200,200)   -- white

-- define out button
hostButton = LifeBoatAPI.LBTouchScreen:lbtouchscreen_newStyledButton(85, 13, 58, 9, "Host Server", color_Highlight, color_Inactive, color_Active, color_Highlight,color_Inactive) -- using the TouchScreen functionality from LifeBoatAPI - make a simple button
stopHostingButton = LifeBoatAPI.LBTouchScreen:lbtouchscreen_newStyledButton(79, 89, 58, 6, "Kill Server", color_Highlight, color_Inactive, color_Active, color_Highlight,color_Inactive) -- using the TouchScreen functionality from LifeBoatAPI - make a simple button

hosting = false
connected = false

function onTick()
    LifeBoatAPI.LBTouchScreen:lbtouchscreen_onTick() -- touchscreen handler provided by LifeBoatAPI. Handles checking for clicks/releases etc.
    inputX = input.getNumber(3)
    inputY = input.getNumber(4)
    ppressed = input.getBool(1) and not isPressed
    isPressed = input.getBool(1)

    serverCode = property.getNumber("Server code")
    if serverCode == 0 then
        serverCode = '0'
    else
        serverCode = string.format("%.0f", serverCode)
    end

    if hostButton:lbstyledbutton_isReleased() and not hosting then
        if serverCode ~= '0' then
            hosting = true
        else
            --std:throw(400)
            --TODO: draw error text here
        end
    end

    if stopHostingButton:lbstyledbutton_isReleased() and hosting then
        hosting = false
    end

    if hosting then
        output.setBool(1, true)
        output.setNumber(1, tonumber(serverCode))
    else
        output.setBool(1, false)
        output.setNumber(1,0)
    end
end

function onDraw()
    --if not connected then should probably prompt to connect or host
    if not connected and not hosting then
        screen.setColor(255,255,255)
        screen.drawText(1,1, "Enter Server Code: ")
        screen.drawText(1,15, "Or start hosting: ")
        hostButton:lbstyledbutton_draw()

    end
    if hosting then
        screen.setColor(255,255,255)
        screen.drawText(1,screen.getHeight() - 6, "Hosting:" .. serverCode)
        stopHostingButton:lbstyledbutton_draw()
    end
end

function drawKeypad(x,y)
    local table = {7,8,9,4,5,6,1,2,3,"d",0,"e"}
    for i=1, i < 12 do
        butt(x,y,table[i])
    end
end

-- It's a function that draws a button.
function butt(x,y,l,s) --bottom left, letter, table to add letter into.
    local sc = screen
    sc.setColor(0,0,0)
    local fuck = isPressed and isPointInRectangle(inputX, inputY, x, y, 6, 7)
    if fuck then sc.setColor(20,20,20) sc.drawRectF(x,y, 6, 7) else sc.drawRectF(x,y, 6, 7) end
    
    sc.setColor(255,255,255)
    sc.drawText(x + 1, y + 1, l)
    if s and fuck and ppressed then
        b[tablelength(b) + 1] = l
    end
    return fuck
end

-- It's a function that checks if a point is within a rectangle.
function isPointInRectangle(x, y, rectX, rectY, rectW, rectH)
    return x >= rectX and y >= rectY and x < rectX+rectW and y < rectY+rectH
end