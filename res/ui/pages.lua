function drawCHub()
    ws = width / 1600
    hs = height / 900
    ws1 = width / 1920
    hs1 = height / 1080
    love.graphics.draw(cBg, 0, 0, 0, ws, hs)
    love.graphics.setColor(btnColR * 4, btnColG * 4, btnColB * 8, 1.0)
    love.graphics.draw(backBtn, 5, 5, 0, ws1, hs1)
    height1 = 0
    line1 = 0
    printed = ""
    while (true) do
        love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
        love.graphics.rectangle("fill", width * 0.9, height * 0.125 + height1, width * 0.075, height * 0.045)
        love.graphics.setColor(1, 1, 1)
        if (line1 == 0) then
            printed = "Nuclear"
        elseif (line1 == 1) then
            printed = "Rockets"
        elseif (line1 == 2) then
            printed = "Machine Gun"
        elseif (line1 == 3) then
            printed = "Force Field"
        elseif (line1 == 4) then
            printed = "Lightjump"
        end
        love.graphics.print(printed, width * 0.9 + (height * 0.005), height * 0.125 + height1 + (height * 0.015))
        height1 = height1 + (height * 0.055)
        line1 = line1 + 1
        if (line1 >= 5) then
            break
        end
    end
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", width * 0.9, height * 0.125 - (height * 0.055), width * 0.075, height * 0.045)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("No Show", width * 0.9 + (height * 0.005), height * 0.125 - (height * 0.055) + (height * 0.015))
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("$" .. math.floor(money), width * 0.955, height * 0.96)
    wi = (width / 512) * 0.25
    mi = wi * 512
    mi = mi / 2
    mix = mi + (width * 0.075)
    yo = height * 0.075
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("fill", xCenter - mix - (mix * 0.075), yCenter - mi - (mi * 0.075) - yo, (wi * 512) + (mix * 0.15), (wi * 512) + (mi * 0.15))
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", xCenter - mix, yCenter - mi - yo, wi * 512, wi * 512)
    love.graphics.setColor(1, 1, 1, 1)
    if (showWeaponType == 1) then
        love.graphics.draw(bombImg, xCenter - mix, yCenter - mi - yo, 0, wi, wi)
    elseif (showWeaponType == 2) then
        love.graphics.draw(rocketsImg, xCenter - mix, yCenter - mi - yo, 0, wi, wi)
    elseif (showWeaponType == 3) then
        love.graphics.draw(machgunImg, xCenter - mix, yCenter - mi - yo, 0, wi, wi)
    elseif (showWeaponType == 4) then
        love.graphics.draw(forcefieldImg, xCenter - mix, yCenter - mi - yo, 0, wi, wi)
    elseif (showWeaponType == 5) then
        love.graphics.draw(lightjumpImg, xCenter - mix, yCenter - mi - yo, 0, wi, wi)
    end
    love.graphics.setColor(1, 0, 0, 1)
    textCoordsX = xCenter - mix - (mix * 0.075)
    if (showWeaponType == 0) then
        love.graphics.print("(none)", textCoordsX, height * 0.675)
        love.graphics.print("(none)", textCoordsX, height * 0.7)
    elseif (showWeaponType == 1) then
        love.graphics.print("Nuclear Bomb", textCoordsX, height * 0.675)
        love.graphics.print("Just a big bomb. At the time of the game, nuclear bombs - are a classic.", textCoordsX, height * 0.7)
    elseif (showWeaponType == 2) then
        love.graphics.print("Rockets", textCoordsX, height * 0.675)
        love.graphics.print("Shoots 4-8 homing rockets.", textCoordsX, height * 0.7)
    elseif (showWeaponType == 3) then
        love.graphics.print("Machine Gun", textCoordsX, height * 0.675)
        love.graphics.print("This gun fires so fast.", textCoordsX, height * 0.7)
    elseif (showWeaponType == 4) then
        love.graphics.print("Force Field", textCoordsX, height * 0.675)
        love.graphics.print("Makes a shield around the entire perimeter of your ship.", textCoordsX, height * 0.7)
    elseif (showWeaponType == 5) then
        love.graphics.print("Lightjump", textCoordsX, height * 0.675)
        love.graphics.print("Upgrades your ship's max jumps around stars.", textCoordsX, height * 0.7)
    end
end

function drawHub()
    ws = width / 1600
    hs = height / 900
    ws1 = width / (1920 / 2)
    hs1 = height / (1080 / 2)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(hubBg, 0, 0, 0, ws, hs)
    love.graphics.draw(techBtn, width * 0.2, height * 0.4 - 100, 0, ws1, hs1)
    love.graphics.draw(spaceShipsBtn, width * 0.7, height * 0.4 - 100, 0, ws1, hs1)
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", width * 0.2, height * 0.4, 160, 100)
    love.graphics.rectangle("fill", width * 0.7, height * 0.4, 160, 100)
    love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Research Hub", width * 0.2 + 5, height * 0.4 + 40)
    love.graphics.print("Spaceship construct Hub", width * 0.7 + 5, height * 0.4 + 40)
    love.graphics.print("$" .. math.floor(money), width * 0.955, height * 0.96)
end

function drawTHub()
    ws = width / 1600
    hs = height / 900
    ws1 = width / 1920
    hs1 = height / 1080
    love.graphics.draw(tBg, 0, 0, 0, ws, hs)
    love.graphics.setColor(btnColR * 4, btnColG * 4, btnColB * 8, 1.0)
    love.graphics.draw(backBtn, 5, 5, 0, ws1, hs1)
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", (xCenter - 2) - (width * 0.05), yCenter - (height * 0.05), width * 0.05, height * 0.045)
    love.graphics.rectangle("fill", (xCenter + 2), yCenter - (height * 0.05), width * 0.05, height * 0.045)
    love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
    love.graphics.setColor(1, 1, 1, 1.0)
    love.graphics.print("Upgrade", (xCenter + 5) - (width * 0.05), (yCenter - (height * 0.05)) + (height * 0.015))
    love.graphics.print("Downgrade", (xCenter + 7), (yCenter - (height * 0.05)) + (height * 0.015))
    love.graphics.print("$" .. math.floor(money), width * 0.955, height * 0.96)
end

function drawMenu()
    ws = width / 1600
    hs = height / 900
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(menuBg, 0, 0, 0, ws, hs)
    love.graphics.setColor(0.2, 0.2, 0.3, 0.5)
    love.graphics.rectangle("fill", xCenter - 250, 0, 500, height)
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", playButtonX, playButtonY, 100, 50)
    love.graphics.rectangle("fill", playButtonX, playButtonY + 55, 100, 50)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Start/Continue", xCenter - 45, yCenter - 10)
    love.graphics.print("Exit", xCenter - 45, yCenter + 45)
end

function drawPause()
    love.graphics.setColor(0.2, 0.2, 0.3, 0.5)
    love.graphics.rectangle("fill", 0, 0, width, height)
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", playButtonX, playButtonY, 100, 50)
    love.graphics.rectangle("fill", playButtonX, playButtonY + 55, 100, 50)
    love.graphics.rectangle("fill", playButtonX, playButtonY + 110, 100, 50)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Resume", xCenter - 45, yCenter - 10)
    love.graphics.print("Main Menu", xCenter - 45, yCenter + 45)
    love.graphics.print("Exit", xCenter - 45, yCenter + 105)
end