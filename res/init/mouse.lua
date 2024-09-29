function initClick()
    if (isMZone(playButtonX, playButtonY, (playButtonX + 100), (playButtonY + 50)) == true and isMenu == true) then
        printNow("Game started", true)
        isMenu = false
        isHub = true
    elseif (isMZone(playButtonX, playButtonY, (playButtonX + 100), (playButtonY + 50)) == true and isPaused == true) then
        printNow("Unpaused", true)
        isPaused = false
    elseif (isMZone(playButtonX, playButtonY + 55, (playButtonX + 100), (playButtonY + 105)) == true and (isPaused == true)) then
        printNow("Main menu page.", true)
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
        if (money >= 25 and qlu == false and level < 4) then
            printNow("-$25 from money", true)
            qlu = true
            qlut = timer + 180
            if (fastUp == true) then
                qlut = qlut - 178
            end
            money = money - 25
        elseif (money < 25) then
            printNow("Not enougth money", true)
        elseif (qlu == true) then
            printNow("Too fast upgrade", true)
        else
            printNow("Too many levels", true)
        end
    elseif (isMZone((xCenter + 2) + (width * 0.025), yCenter - (height * 0.0225), ((xCenter + 2) + (width * 0.025)) + width * 0.05, (yCenter - (height * 0.0225)) + height * 0.045) and (isPaused == false and isMenu == false and isTechHub == true)) then
        if (level > 1) then
            printNow("+$25 to money", true)
            level = level - 1
            money = money + 25
        else
            printNow("Not enougth levels", true)
        end
    elseif (isMZone(width * 0.9, height * 0.125 + (height * 0.055), (width * 0.9) + (width * 0.075), (height * 0.125 + (height * 0.055)) + (height * 0.045)) and (isPaused == false and isMenu == false and isTechHub == false and isCHub == true)) then
        if (money >= 50 and nuclearEqupped == true) then
            printNow("-$50 from money", true)
            money = money - 50
        elseif (money < 50) then
            printNow("Not enougth money", true)
        else
            printNow("Already equiped", true)
        end
    end
end