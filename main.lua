terminalStr = ""
lines = 0

function printNow(printing, isSys)
    print(printing)
    lines = lines + 1
    if (lines >= 23) then
        terminalStr = ""
        lines = 1
    end
    if (isSys == true) then
        terminalStr = terminalStr .. printing .. "\n"
    else
        terminalStr = terminalStr .. "user-input:  " .. printing .. "\n"
    end
end

function love.load()
    fps, delta = 0, 0
    printNow("Loading resolution...", true)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    xCenter, yCenter = width * 0.5, height * 0.5
    debugMode = true
    isCHub, isTechHub, isTerminal, isHub, released, isMenu, isPaused = false, false, false, false, false, true, false
    keyPessedNow = ""
    printNow("Loading background textures...", true)
    hubBg, menuBg = love.graphics.newImage("res/textures/hubBg.png"), love.graphics.newImage("res/textures/menuBg.png")
    printNow("Loading button textures...", true)
    spaceShipsBtn, backBtn, techBtn = love.graphics.newImage("res/textures/btn/spaceShipsBtn.png"), love.graphics.newImage("res/textures/btn/backBtn.png"), love.graphics.newImage("res/textures/btn/techBtn.png")
    --printNow("Loading entity textures...", true)
    --enemyEnt = love.graphics.newImage("res/textures/ent/enemyEnt.png")
    playButtonX, playButtonY = xCenter - 50, yCenter - 25
    mx, my = 0
    btnColR, btnColG, btnColB = 0.2, 0.2, 0.25
    timer = 0
    command = ""
    cheats = false
    infinityMoney = false
    money = 0
    level = 1
    planetSum = 1 * level
    qlu = false
    qlut = 0
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    -- Textures
    if (isMenu == true) then
        love.graphics.draw(menuBg, 0, 0, 0, 1, 1)
    end
    if (isHub == true) then
        love.graphics.draw(hubBg, 0, 0, 0, 1, 1)
    end
    -- UI
    if (isMenu == false and isHub == false) then -- backBtn
        love.graphics.draw(backBtn, 5, 5, 0, 1, 1)
    end
    if (isHub == true) then -- Main Hub
        love.graphics.draw(techBtn, width * 0.2, height * 0.4 - 100, 0, 2, 2)
        love.graphics.draw(spaceShipsBtn, width * 0.8, height * 0.4 - 100, 0, 2, 2)
        love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
        love.graphics.rectangle("fill", width * 0.2, height * 0.4, 160, 100)
        love.graphics.rectangle("fill", width * 0.8, height * 0.4, 160, 100)
        love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Research Hub", width * 0.2 + 5, height * 0.4 + 40)
        love.graphics.print("Spaceship construct Hub", width * 0.8 + 5, height * 0.4 + 40)
        love.graphics.print("$" .. money, width * 0.955, height * 0.96)
    end
    if (isTechHub == true) then -- Research Hub
        love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
        love.graphics.rectangle("fill", (xCenter - 2) - (width * 0.025), yCenter - (height * 0.0225), width * 0.05, height * 0.045)
        love.graphics.rectangle("fill", (xCenter + 2) + (width * 0.025), yCenter - (height * 0.0225), width * 0.05, height * 0.045)
        love.graphics.rectangle("fill", width * 0.95, height * 0.95, width * 0.045, height * 0.04)
        love.graphics.setColor(1, 1, 1, 1.0)
        love.graphics.print("Upgrade", (xCenter + 5) - (width * 0.025), (yCenter + (height * 0.015)) - (height * 0.0225))
        love.graphics.print("Downgrade", (xCenter + 7) + (width * 0.025), (yCenter + (height * 0.015)) - (height * 0.0225))
        love.graphics.print("$" .. money, width * 0.955, height * 0.96)
    end
    if (isMenu == true) then -- Main Menu
        love.graphics.setColor(0.2, 0.2, 0.3, 0.5)
        love.graphics.rectangle("fill", xCenter - 250, 0, 500, height)
        love.graphics.setColor(btnColR, btnColG, btnColB, 1.0)
        love.graphics.rectangle("fill", playButtonX, playButtonY, 100, 50)
        love.graphics.rectangle("fill", playButtonX, playButtonY + 55, 100, 50)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Start/Continue", xCenter - 45, yCenter - 10)
        love.graphics.print("Exit", xCenter - 45, yCenter + 45)
    end
    if (isPaused == true) then -- Pause Menu
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
    if (isTerminal == true) then
        love.graphics.setColor(0.2, 0.2, 0.3, 0.85)
        love.graphics.rectangle("fill", 0, 0, width, height * 0.3)
        love.graphics.rectangle("fill", 0, height * 0.3 + 1, width, 20)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print(command, 5, height * 0.3 + 1)
        love.graphics.print(terminalStr, 5, 5)
    end
    -- Debug
    if (debugMode == true) then
        love.graphics.setColor(0.2, 0.2, 0.25, 0.75)
        love.graphics.rectangle("fill", 20, 20, 184, 50)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("FPS: " .. fps, 25, 27)
        love.graphics.print("Delta: " .. delta, 25, 47)
        love.graphics.print(keyPessedNow, 25, height - 80)
        love.graphics.print(mx .. "   " .. my, 25, height - 180)
        love.graphics.print("qlut: ", 25, height - 100)
        love.graphics.print("qlu: " .. tostring(qlu), 25, height - 120)
        love.graphics.print("level: " .. level, 25, height - 140)
        love.graphics.print("planetSum: " .. planetSum, 25, height - 160)
        if (qlut ~= 0) then
            love.graphics.print((qlut - timer), 60, height - 100)
        else
            love.graphics.print(0, 60, height - 100)
        end
    end
end

function isMZone(x1, y1, x2, y2)
    return (mx >= x1 and my >= y1 and mx <= x2 and my <= y2)
end

function exitApp(num)
    os.exit(num)
end

function runCommand(commandL)
    if (commandL == "exit") then
        printNow("Exiting...", true)
        exitApp(0)
    elseif (commandL == "sw-cheats") then
        if (cheats == true) then
            cheats = false
        else
            cheats = true
        end
        printNow("cheats = " .. tostring(cheats), true)
    elseif (commandL == "sex") then
        printNow("No sex :(", true)
    elseif (commandL == "kamenb.") then
        printNow("Ne dam!", true)
    elseif (commandL == "sw-inf-money") then
        if (cheats == true) then
            if (infinityMoney == true) then
                infinityMoney = false
            else
                infinityMoney = true
            end
            printNow("infinityMoney = " .. tostring(infinityMoney), true)
        else
            printNow("Unknown command.", true)
        end
    elseif (commandL == "clear") then
        terminalStr = ""
        printNow("Terminal cleared", true)
    else
        printNow("Unknown command.", true)
    end
end

function love.update(dt)
    timer = love.timer.getTime()
    delta = dt
    fps = love.timer.getFPS()
    mx, my = love.mouse.getPosition()
    planetSum = 1 * level
    if (math.sin(timer) >= 0.999 and isMenu == false and isPaused == false) then
        money = money + planetSum
        printNow("+$" .. planetSum .. " to money", true)
    end
    if (qlut < timer and qlut ~= 0) then
        qlut = 0
        qlu = false
        level = level + 1
    end
    if (isMenu == true) then
        isHub = false
        isPaused = false
        isTechHub = false
    end
    if (isHub == true) then
        isTechHub = false
        isCHub = false
    end
    if (infinityMoney == true) then
        money = 999999999999999999999
    end
end

function love.keypressed(key)
    keyPessedNow = key
    if (released == true) then
        if (key == "escape") then
            if (isPaused == false and isMenu == false) then
                printNow("Paused", true)
                isPaused = true
            else
                printNow("Unpaused", true)
                isPaused = false
            end
        elseif (key == "application") then
            if (debugMode == false) then
                printNow("Debug mode true", true)
                debugMode = true
            else
                printNow("Debug mode false", true)
                debugMode = false
            end
        elseif (key == "`") then
            if (isTerminal == false) then
                printNow("Terminal is opened", true)
                isTerminal = true
            else
                printNow("Terminal is closed", true)
                command = ""
                isTerminal = false
            end
        end
        if (isTerminal == true) then
            if (key ~= "escape" and key ~= "backspace" and key ~= "application" and key ~= "kpenter" and key ~= "`" and key ~= "return" and key ~= "space" and key ~= "lgui" and key ~= "rgui" and key ~= "capslock" and key ~= "tab" and key ~= "lshift" and key ~= "rshift" and key ~= "lctrl" and key ~= "rctrl" and key ~= "lalt" and key ~= "ralt") then
                command = command .. key
            elseif (key == "backspace") then
                command = command:sub(1, -2)
            elseif (key == "return" or key == "kpenter") then
                if (command ~= nil) then
                    printNow(command, false)
                    runCommand(command)
                end
                command = ""
            elseif (key == "space") then
                command = command .. " "
            end
        end
    end
    released = false
end

function love.keyreleased(key)
    keyPessedNow = ""
    released = true
end

function love.mousepressed(key)
    if (isMZone(playButtonX, playButtonY, (playButtonX + 100), (playButtonY + 50)) == true and isMenu == true) then
        printNow("Game started", true)
        isMenu = false
        isHub = true
    elseif (isMZone(playButtonX, playButtonY, (playButtonX + 100), (playButtonY + 50)) == true and isPaused == true) then
        printNow("Unpaused", true)
        isPaused = false
    elseif (isMZone(playButtonX, playButtonY + 55, (playButtonX + 100), (playButtonY + 105)) == true and (isPaused == true)) then
        printNow("Main menu is opened...", true)
        isPaused = false
        isHub = false
        isMenu = true
    elseif (isMZone(playButtonX, playButtonY + 55, (playButtonX + 100), (playButtonY + 105)) == true and (isMenu == true)) then
        printNow("Exiting...", true)
        exitApp(0)
    elseif (isMZone(playButtonX, playButtonY + 110, (playButtonX + 100), (playButtonY + 160)) == true and (isPaused == true)) then
        printNow("Exiting...", true)
        exitApp(0)
    elseif (isMZone(width * 0.2, height * 0.4, (width * 0.2 + 160), (height * 0.4 + 100)) and (isPaused == false and isMenu == false) and isHub == true) then
        printNow("Tech Page.", true)
        isHub = false
        isTechHub = true
    elseif (isMZone(5, 5, (105), (55)) and (isPaused == false and isMenu == false and isHub == false)) then
        printNow("Hub Page.", true)
        isHub = true
    elseif (isMZone(width * 0.8, height * 0.4, (width * 0.8 + 160), (height * 0.4 + 100)) and (isPaused == false and isMenu == false)) then
        printNow("Ship construction Page.", true)
        isCHub = true
        isHub = false
    elseif (isMZone((xCenter - 2) - (width * 0.025), yCenter - (height * 0.0225), ((xCenter - 2) - (width * 0.025)) + width * 0.05, (yCenter - (height * 0.0225)) + height * 0.045) and (isPaused == false and isMenu == false and isTechHub == true)) then
        if (money >= 25 and qlu == false) then
            printNow("-$25 from money", true)
            qlu = true
            qlut = timer + 180
            money = money - 25
        elseif (money < 25) then
            printNow("Not enougth money", true)
        else
            printNow("Too fast upgrade", true)
        end
    elseif (isMZone((xCenter + 2) + (width * 0.025), yCenter - (height * 0.0225), ((xCenter + 2) + (width * 0.025)) + width * 0.05, (yCenter - (height * 0.0225)) + height * 0.045) and (isPaused == false and isMenu == false and isTechHub == true)) then
        if (level > 1) then
            printNow("+$25 to money", true)
            level = level - 1
            money = money + 25
        else
            printNow("Not enougth levels", true)
        end
    end
end
