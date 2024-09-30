function drawDebug()
    love.graphics.setColor(0.2, 0.2, 0.25, 0.75)
    love.graphics.rectangle("fill", 20, 20, 184, 50)
    love.graphics.rectangle("fill", 20, height - 80, 184, -200)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("FPS: " .. fps, 25, 27)
    love.graphics.print("Delta: " .. delta, 25, 47)
    love.graphics.print(keyPessedNow, 25, height - 80)
    love.graphics.print(mx .. "   " .. my, 25, height - 180)
    love.graphics.print("fastUp: " .. tostring(fastUp), 25, height - 200)
    love.graphics.print("cheats: " .. tostring(cheats), 25, height - 220)
    love.graphics.print("infinityMoney: " .. tostring(infinityMoney), 25, height - 240)
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