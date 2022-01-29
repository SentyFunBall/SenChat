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

hosting = false
connected = false

function onTick()
    LifeBoatAPI.LBTouchScreen:lbtouchscreen_onTick() -- touchscreen handler provided by LifeBoatAPI. Handles checking for clicks/releases etc.
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
end

function onDraw()
    --if not connected then should probably prompt to connect or host
    if not connected and not hosting then
        screen.setColor(255,255,255)
        screen.drawText(1,1, "Enter Server Code: ")
        screen.drawText(1,15, "Or start hosting: ")
        hostButton:lbstyledbutton_draw()

        output.setBool(1, false)
        output.setNumber(1, 0)
    end
    if hosting then
        screen.setColor(255,255,255)
        screen.drawText(1,screen.getHeight() - 6, "Hosting:" .. serverCode)
        output.setNumber(1, serverCode)
        output.setBool(1, true)
    end
end