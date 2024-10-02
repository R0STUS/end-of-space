function loadBtns()
    -- Construction Page
    buttons.list[#buttons.list + 1] = {x = width * 0.7, y = height * 0.4, w = 160, h = 100, callback=function() initButton("constrPg") end}
    -- Back
    buttons.list[#buttons.list + 1] = {x = 5, y = 5, w = 75, h = 50, callback=function() initButton("backBt") end}
    -- Tech Page
    buttons.list[#buttons.list + 1] = {x = width * 0.2, y = height * 0.4, w = 160, h = 100, callback=function() initButton("techPg") end}
    -- Nuclear View
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = height * 0.125, w = width * 0.075, h = height * 0.045, callback=function() initButton("nclrV") end}
    -- Rockets View
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = (height * 0.125) + (height * 0.055), w = width * 0.075, h = height * 0.045, callback=function() initButton("rcktsV") end}
    -- Machine Gun View
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = (height * 0.125) + ((height * 0.055) * 2), w = width * 0.075, h = height * 0.045, callback=function() initButton("machGunV") end}
    -- Force Field View
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = (height * 0.125) + ((height * 0.055) * 3), w = width * 0.075, h = height * 0.045, callback=function() initButton("ffV") end}
    -- LightJump View
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = (height * 0.125) + ((height * 0.055) * 4), w = width * 0.075, h = height * 0.045, callback=function() initButton("ligjV") end}
    -- Play
    buttons.list[#buttons.list + 1] = {x = playButtonX, y = playButtonY, w = 100, h = 50, callback=function() initButton("playBt") end}
    -- Exit
    buttons.list[#buttons.list + 1] = {x = playButtonX, y = playButtonY + 55, w = 100, h = 50, callback=function() initButton("exitMBt") end}
    -- Upgrade
    buttons.list[#buttons.list + 1] = {x = (xCenter - 2) - (width * 0.05), y = yCenter - (height * 0.05), w = width * 0.05, h = height * 0.045, callback=function() initButton("upgrdBt") end}
    -- Downgrade
    buttons.list[#buttons.list + 1] = {x = (xCenter + 2), y = yCenter - (height * 0.05), w = width * 0.05, h = height * 0.045, callback=function() initButton("dwgrdBt") end}
    -- Resume
    buttons.list[#buttons.list + 1] = {x = playButtonX, y = playButtonY, w = 100, h = 50, callback=function() initButton("resumeBt") end}
    -- Main Menu
    buttons.list[#buttons.list + 1] = {x = playButtonX, y = playButtonY + 55, w = 100, h = 50, callback=function() initButton("mainMenuBt") end}
    -- Exit
    buttons.list[#buttons.list + 1] = {x = playButtonX, y = playButtonY + 110, w = 100, h = 50, callback=function() initButton("exitBt") end}
    -- No Show
    buttons.list[#buttons.list + 1] = {x = width * 0.9, y = (height * 0.125) - (height * 0.055), w = width * 0.075, h = height * 0.045, callback=function() initButton("noShowV") end}
end