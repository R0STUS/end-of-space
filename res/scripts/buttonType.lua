function initButton(typeb)
    if (typeb == "playBt" and isMenu == true) then
        startG()
    elseif (typeb == "exitMBt" and isMenu == true) then
        exitApp(0)
    elseif (typeb == "techPg" and isHub == true) then
        gotoTech()
    elseif (typeb == "constrPg" and isHub == true) then
        gotoConstr()
    elseif (typeb == "backBt") then
        if (isCHub == true or isTechHub == true) then
            gotoHub()
        end
    elseif (typeb == "upgrdBt" and isTechHub == true) then
        tryUpgrd()
    elseif (typeb == "dwgrdBt" and isTechHub == true) then
        tryDwgrd()
    elseif (typeb == "resumeBt" and isPaused == true) then
        pause()
    elseif (typeb == "mainMenuBt" and isPaused == true) then
        gotoMainMenu()
    elseif (typeb == "exitBt" and isPaused == true) then
        exitApp(0)
    end
end
