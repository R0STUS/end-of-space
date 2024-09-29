function drawCHub() 
    --love.graphics.draw(cBg, 0, 0, 0, 1, 1)
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
end

function drawHub()
    love.graphics.draw(techBtn, width * 0.2, height * 0.4 - 100, 0, 2, 2)
    love.graphics.draw(spaceShipsBtn, width * 0.8, height * 0.4 - 100, 0, 2, 2)
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", width * 0.2, height * 0.4, 160, 100)
    love.graphics.rectangle("fill", width * 0.8, height * 0.4, 160, 100)
    love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Research Hub", width * 0.2 + 5, height * 0.4 + 40)
    love.graphics.print("Spaceship construct Hub", width * 0.8 + 5, height * 0.4 + 40)
    love.graphics.print("$" .. math.floor(money), width * 0.955, height * 0.96)
end

function drawTHub()
    love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
    love.graphics.rectangle("fill", (xCenter - 2) - (width * 0.025), yCenter - (height * 0.0225), width * 0.05, height * 0.045)
    love.graphics.rectangle("fill", (xCenter + 2) + (width * 0.025), yCenter - (height * 0.0225), width * 0.05, height * 0.045)
    love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
    love.graphics.setColor(1, 1, 1, 1.0)
    love.graphics.print("Upgrade", (xCenter + 5) - (width * 0.025), (yCenter + (height * 0.015)) - (height * 0.0225))
    love.graphics.print("Downgrade", (xCenter + 7) + (width * 0.025), (yCenter + (height * 0.015)) - (height * 0.0225))
    love.graphics.print("$" .. math.floor(money), width * 0.955, height * 0.96)
end

function drawMenu()
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