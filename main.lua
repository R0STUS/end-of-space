pages = require('res/ui/pages')
terminal = require('res/ui/terminal')
debug = require('res/ui/debug')
mouse = require('res/scripts/mouse')
btntype = require('res/scripts/buttonType')
btns = require('res/scripts/buttons')
elements = require('res/scripts/elements')

terminalStr = ""
lines = 0

buttons = { list = {} }
function buttons:update()
    for k, v in pairs(self.list) do
        if isMZone(v.x, v.y, v.w, v.h) and love.mouse.isDown(1) then
            v.callback()
        end
    end
end

function printNow(printing, isSys)
    print(" [" .. os.date("%X") .. "] " .. printing)
    lines = lines + 1
    if (lines >= 23) then
        terminalStr = ""
        lines = 1
    end
    if (isSys == true) then
        terminalStr = terminalStr .. " [" .. os.date("%X") .. "] " .. printing .. "\n"
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
    tBg, cBg, hubBg, menuBg = love.graphics.newImage("res/textures/tBg.png"), love.graphics.newImage("res/textures/cBg.png"), love.graphics.newImage("res/textures/hubBg.png"), love.graphics.newImage("res/textures/menuBg.png")
    printNow("Loading button textures...", true)
    spaceShipsBtn, backBtn, techBtn = love.graphics.newImage("res/textures/btn/spaceShipsBtn.png"), love.graphics.newImage("res/textures/btn/backBtn.png"), love.graphics.newImage("res/textures/btn/techBtn.png")
    printNow("Loading entity textures...", true)
    lightjumpImg, forcefieldImg, machgunImg, rocketsImg, bombImg = love.graphics.newImage("res/textures/images/lightjump.png"), love.graphics.newImage("res/textures/images/forcefield.png"), love.graphics.newImage("res/textures/images/machgun.png"), love.graphics.newImage("res/textures/images/rockets.png"), love.graphics.newImage("res/textures/images/bomb.png")
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
    timescale = 1
    showWeaponType = 0
    printNow("Loading buttons...", true)
    loadBtns()
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    -- UI
    if (isCHub == true) then -- Construction Hub
        drawCHub()
    end
    if (isHub == true) then -- Main Hub
        drawHub()
    end
    if (isTechHub == true) then -- Research Hub
        drawTHub()
    end
    if (isMenu == true) then -- Main Menu
        drawMenu()
    end
    if (isPaused == true) then -- Pause Menu
        drawPause()
    end
    if (isTerminal == true) then -- Terminal
        drawTerminal()
    end
    -- Debug
    if (debugMode == true) then
        drawDebug()
    end
end

function pause()
    if (isPaused == false and isMenu == false) then
        printNow("Paused", true)
        isPaused = true
    else
        printNow("Unpaused", true)
        isPaused = false
    end
end

function debugSw()
    if (debugMode == false) then
        printNow("Debug mode true", true)
        debugMode = true
    else
        printNow("Debug mode false", true)
        debugMode = false
    end
end

function termSw()
    if (isTerminal == false) then
        printNow("Terminal is opened", true)
        isTerminal = true
    else
        printNow("Terminal is closed", true)
        command = ""
        isTerminal = false
    end
end

function startG()
    printNow("Starting game...", true)
    isMenu = false
    isHub = true
end

function gotoHub()
    printNow("Hub page", true)
    isHub = true
end

function gotoConstr()
    printNow("Construction Hub page", true)
    isHub = false
    isCHub = true
end

function gotoTech()
    printNow("Tech Hub page", true)
    isHub = false
    isTechHub = true
end

function gotoMainMenu()
    printNow("Main Menu page", true)
    isHub = false
    isMenu = true
end

function tryUpgrd()
    if (money >= 25 and qlu == false and level < 4) then
        printNow("-$25 from money", true)
        money = money - 25
        qlu = true
        qlut = timer + 180
        if (fastUp == true) then
            qlut = timer + 1
        end
    elseif (money < 25) then
        printNow("Not enought money", true)
    elseif (qlu == true) then
        printNow("Too fast upgrade", true)
    else
        printNow("Too many levels", true)
    end
end

function tryDwgrd()
    if (level >= 2) then
        printNow("-1 from level", true)
        printNow("+$25 to money", true)
        money = money + 25
        level = level - 1
    else
        printNow("Not enought levels", true)
    end
end

function isMZone(x1, y1, x2, y2)
    return (mx >= x1 and my >= y1 and mx <= (x1 + x2) and my <= (y1 + y2))
end

function exitApp(num)
    printNow("Exiting...", true)
    os.exit(num)
end

function runCommand(commandL)
    if (commandL == "exit") then
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
    elseif (commandL == "sw-timescale-x2") then
        if (cheats == true) then
            if (timescale ~= 2) then
                timescale = 2
            else
                timescale = 1
            end
            printNow("timescale = " .. timescale, true)
        else
            printNow("Unknown command.", true)
        end
    elseif (commandL == "sw-timescale-x4") then
        if (cheats == true) then
            if (timescale ~= 4) then
                timescale = 4
            else
                timescale = 1
            end
            printNow("timescale = " .. timescale, true)
        else
            printNow("Unknown command.", true)
        end
    elseif (commandL == "sw-timescale-x0.5") then
        if (cheats == true) then
            if (timescale ~= 0.5) then
                timescale = 0.5
            else
                timescale = 1
            end
            printNow("timescale = " .. timescale, true)
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
    delta = dt
    timer = timer + (delta * timescale)
    fps = love.timer.getFPS()
    mx, my = love.mouse.getPosition()
    planetSum = planets * level
    if (isMenu == false and isPaused == false) then
        money = money + (planetSum * (delta * timescale))
        sum = sum + (planetSum * (delta * timescale))
        if (nextPrint <= timer) then
            printNow("+$" .. math.floor(sum) .. " to money", true)
            sum = 0
            nextPrint = timer + 5
        end
    end
    if (isPaused == true) then
        timer = timer - (delta * timescale)
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
            pause()
        elseif (key == "application") then
            debugSw()
        elseif (key == "`") then
            termSw()
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
