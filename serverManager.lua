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

tick = 0
userServerCode = ""

function onTick()
    LifeBoatAPI.LBTouchScreen:lbtouchscreen_onTick() -- touchscreen handler provided by LifeBoatAPI. Handles checking for clicks/releases etc.
    inputY = input.getNumber(4)
    inputX = input.getNumber(3)
    ppressed = input.getBool(1) and not isPressed
    isPressed = input.getBool(1)
    draw = input.getBool(2)

    if not draw then
        tick = 0
    end

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
     end
end

function onDraw()
    if draw then
        if tick <= 1 then
            tick = (tick+0.05)
        end
        --if not connected then should probably prompt to connect or host
        if not connected and not hosting then
            screen.setColor(255,255,255)
            screen.drawText(1,1, "Enter Server Code: "..userServerCode)
            screen.drawText(1,15, "Or start hosting: ")
            hostButton:lbstyledbutton_draw()
            drawKeypad(138,lerp(96,63,tick),true)
        end
        if hosting then
            screen.setColor(255,255,255)
            screen.drawText(1,screen.getHeight() - 6, "Hosting:" .. serverCode)
            stopHostingButton:lbstyledbutton_draw()
        end
    end
end

function drawKeypad(x,y,outline)
    local table = {"1","2","3","4","5","6","7","8","9","d","0","e"}
    if butt(x,y,table[1],{255,255,255},outline) then userServerCode = userServerCode .. "1" end
    if butt(x+7,y,table[2],{255,255,255}, outline) then userServerCode = userServerCode .. "2" end
    if butt(x+14,y,table[3],{255,255,255}, outline) then userServerCode = userServerCode .. "3" end
    if butt(x,y+8,table[4],{255,255,255}, outline) then userServerCode = userServerCode .. "4" end
    if butt(x+7,y+8,table[5],{255,255,255}, outline) then userServerCode = userServerCode .. "5" end
    if butt(x+14,y+8,table[6],{255,255,255}, outline) then userServerCode = userServerCode .. "6" end
    if butt(x,y+16,table[7],{255,255,255}, outline) then userServerCode = userServerCode .. "7" end
    if butt(x+7,y+16,table[8],{255,255,255}, outline) then userServerCode = userServerCode .. "8" end
    if butt(x+14,y+16,table[9],{255,255,255}, outline) then userServerCode = userServerCode .. "9" end
    if butt(x,y+24,table[10],{255,0,0}, outline) then userServerCode = string.sub(userServerCode, 0, string.len(userServerCode)-1) end
    if butt(x+7,y+24,table[11],{255,255,255}, outline) then userServerCode = userServerCode .. "0" end
    if butt(x+14,y+24,table[12],{0,255,0}, outline) then userServerCode = userServerCode .. "e" end
end

function butt(x,y,l,color,outline) --bottom left, letter, color (rgb table)
    local sc = screen
    sc.setColor(0,0,0)
    local fuck = ppressed and isPointInRectangle(inputX, inputY, x+1, y+1, 6, 7)
    if fuck then sc.setColor(20,20,20) sc.drawRectF(x+1,y+1, 6, 7) else sc.drawRectF(x,y, 7, 8) end
    if outline then sc.setColor(255,255,255) sc.drawRect(x,y, 7, 8) end
    sc.setColor(color[1],color[2],color[3])
    sc.drawText(x + 2, y + 2, l)
    return fuck
end

-- It's a function that checks if a point is within a rectangle.
function isPointInRectangle(x, y, rectX, rectY, rectW, rectH)
    return x >= rectX and y >= rectY and x < rectX+rectW and y < rectY+rectH
end

function lerp(a,b,p) --start(0%),end(100%), percentage
    return (1-p)*a+p*b
end