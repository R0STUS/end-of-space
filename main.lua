pages = require('res/ui/pages')
terminal = require('res/ui/terminal')
debug = require('res/ui/debug')
mouse = require('res/init/mouse')

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
    infinityMoney, fastUp = false, false
    money = 0
    level = 1
    planets = 1
    planetSum = planets * level
    qlu = false
    qlut = 0
    nextPrint = 0
    sum = 0
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
    if (isCHub == true) then -- Construction Hub
        drawCHub(btnColR, btnColG, btnColB, cBg, width, height)
    end
    if (isHub == true) then -- Main Hub
        drawHub(btnColR, btnColG, btnColB, cBg, width, height, money)
    end
    if (isTechHub == true) then -- Research Hub
        drawTHub(btnColR, btnColG, btnColB, cBg, width, height, money, xCenter, yCenter)
    end
    if (isMenu == true) then -- Main Menu
        drawMenu()
    end
    if (isPaused == true) then -- Pause Menu
        drawPause()
    end
    if (isTerminal == true) then
        drawTerminal()
    end
    -- Debug
    if (debugMode == true) then
        drawDebug()
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
    elseif (commandL == "sw-fast-up") then
        if (cheats == true) then
            if (fastUp == true) then
                fastUp = false
            else
                fastUp = true
            end
            printNow("fastUp = " .. tostring(fastUp), true)
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
    time = love.timer.getTime()
    timer = timer + dt
    delta = dt
    fps = love.timer.getFPS()
    mx, my = love.mouse.getPosition()
    planetSum = planets * level
    if (isMenu == false and isPaused == false) then
        money = money + (planetSum * delta)
        sum = sum + (planetSum * delta)
        if (nextPrint <= timer) then
            printNow("+$" .. math.floor(sum) .. " to money", true)
            sum = 0
            nextPrint = timer + 5
        end
    end
    if (isPaused == true) then
        timer = timer - delta
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
            userInput(key)
        end
    end
    released = false
end

function love.keyreleased(key)
    keyPessedNow = ""
    released = true
end

function love.mousepressed(key)
    initClick()
end
