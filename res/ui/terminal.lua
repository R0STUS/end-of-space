function drawTerminal()
    love.graphics.setColor(0.2, 0.2, 0.3, 0.85)
    love.graphics.rectangle("fill", 0, 0, width, height * 0.3)
    love.graphics.rectangle("fill", 0, height * 0.3 + 1, width, 20)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(command, 5, height * 0.3 + 1)
    love.graphics.print(terminalStr, 5, 5)
end

function userInput(key)
    if (key ~= "escape" and key ~= "backspace" and key ~= "application" and key ~= "left" and key ~= "right" and key ~= "down" and key ~= "up" and key ~= "kpenter" and key ~= "`" and key ~= "return" and key ~= "space" and key ~= "lgui" and key ~= "rgui" and key ~= "capslock" and key ~= "tab" and key ~= "lshift" and key ~= "rshift" and key ~= "lctrl" and key ~= "rctrl" and key ~= "lalt" and key ~= "ralt") then
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