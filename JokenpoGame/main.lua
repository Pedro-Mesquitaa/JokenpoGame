function ia(playerS)

    iaS = math.random(1, 3)
    
    if iaS == 1 and playerS == 3 then

        return false
    elseif iaS == 1 and playerS == 1 then

        return 1
    elseif iaS == 1 and playerS == 2 then

        return 2
    elseif iaS == 2 and playerS == 1 then

        return false
    elseif iaS == 2 and playerS == 2 then

        return 1
    elseif iaS == 2 and playerS == 3 then

        return 2
    elseif iaS == 3 and playerS == 1 then

        return 2
    elseif iaS == 3 and playerS == 3 then

        return 1
    elseif iaS == 3 and playerS == 2 then

        return false
    end
end
function love.load()
    
    love.graphics.setBackgroundColor(1, 0.784, 0.341)

    local Colors = {
        Amarelo = {1, 0.784, 0.341},
        Cinza = {0.110, 0.110, 0.110},
        Branco = {0.957, 0.969, 0.961}
    }

    Images = {
        computer = love.graphics.newImage("images/pc.png"),
        player = love.graphics.newImage("images/player.png"),
        Rock = love.graphics.newImage("images/rock.png"),
        Paper = love.graphics.newImage("images/paper.png"),
        Cut = love.graphics.newImage("images/cut.png");
    }

    Fonts = {
        _30 = love.graphics.newFont("fonts/LondrinaSolid-Regular.ttf", 30),
        _50 = love.graphics.newFont("fonts/LondrinaSolid-Regular.ttf", 50),
        _70 = love.graphics.newFont("fonts/LondrinaSolid-Regular.ttf", 70),
        _145 = love.graphics.newFont("fonts/LondrinaSolid-Regular.ttf", 145)
    }

    Start = {
        Visible = true,

        Title = {
            text = "JOKENPÔ",
            x = 252, -- +10
            y = 145
        },

        StartButton = {
            mode = "fill",
            x = 362, -- -10
            y = 530,
            width = 279,
            height = 75,

            StartText = {
                text = "JOGAR",
                x = 442,
                y = 538
            }
        }
    }

    Game = {
        Visible = false,

        BackBox = {
            mode = "fill",
            x = 20,
            y = 18, 
            width = 168,
            height = 33,

            BackBoxText = {
                text = "Voltar",
                x = 69,
                y = 16
            }
        },

        Placar = {
            text = "PLACAR",
            x = 418,
            y = 91,

            PlacarBox = {
                mode = "fill",
                x = 297,
                y = 185,
                width = 450,
                height = 100,

                PcImage = {
                    image = Images.computer,
                    x = 334,
                    y = 205
                },

                PointPc = {
                    text = "0",
                    x = 460,
                    y = 205
                },

                Space = {
                    text = "-",
                    x = 510,
                    y = 200
                },

                PointPlayer = {
                    text = "0",
                    x = 555,
                    y = 205
                },

                PlayerImage = {
                    image = Images.player,
                    x = 630,
                    y = 200
                }
            }
        },

        Options = {
            
            Rock = {
                image = Images.Rock,
                x = 233,
                y = 400
            }, 
            
            Paper = {
                image = Images.Paper,
                x = 460,
                y = 400
            }, 

            Cut = {
                image = Images.Cut,
                x = 680,
                y = 400
            }
        },

        Result = {
            Visible1 = false,
            Visible2 = false,
            Visible3 = false,


            Text1 = "O COMPUTADOR GANHOU!",
            x1 = 420,
            y1 = 560,

            Text2 = "VOCÊ GANHOU!",
            x2 = 440,
            y2 = 560,

            Text3 = "EMPATE!",
            x3 = 465,
            y3 = 560
        }
    }
end

function love.draw()

    if Start.Visible then

        love.graphics.setFont(Fonts._145)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Start.Title.text, Start.Title.x, Start.Title.y)

        love.graphics.setColor(0.957, 0.969, 0.961)
        love.graphics.rectangle(Start.StartButton.mode, Start.StartButton.x, Start.StartButton.y, Start.StartButton.width, Start.StartButton.height, 20,20,20,20)

        love.graphics.setFont(Fonts._50)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Start.StartButton.StartText.text, Start.StartButton.StartText.x, Start.StartButton.StartText.y)
    end

    if Game.Visible then

        love.graphics.setColor(0.957, 0.969, 0.961)
        love.graphics.rectangle(Game.BackBox.mode, Game.BackBox.x, Game.BackBox.y, Game.BackBox.width, Game.BackBox.height, 10,10,10,10)

        love.graphics.setFont(Fonts._30)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Game.BackBox.BackBoxText.text, Game.BackBox.BackBoxText.x, Game.BackBox.BackBoxText.y)

        love.graphics.setFont(Fonts._70)
        love.graphics.print(Game.Placar.text, Game.Placar.x, Game.Placar.y)

        love.graphics.setColor(0.957, 0.969, 0.961)
        love.graphics.rectangle(Game.Placar.PlacarBox.mode, Game.Placar.PlacarBox.x, Game.Placar.PlacarBox.y, Game.Placar.PlacarBox.width, Game.Placar.PlacarBox.height, 15,15,15,15)

        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.draw(Game.Placar.PlacarBox.PcImage.image, Game.Placar.PlacarBox.PcImage.x, Game.Placar.PlacarBox.PcImage.y)

        love.graphics.setFont(Fonts._50)
        love.graphics.print(Game.Placar.PlacarBox.PointPc.text, Game.Placar.PlacarBox.PointPc.x, Game.Placar.PlacarBox.PointPc.y)
        love.graphics.print(Game.Placar.PlacarBox.Space.text, Game.Placar.PlacarBox.Space.x, Game.Placar.PlacarBox.Space.y)
        love.graphics.print(Game.Placar.PlacarBox.PointPlayer.text, Game.Placar.PlacarBox.PointPlayer.x, Game.Placar.PlacarBox.PointPlayer.y)

        love.graphics.draw(Game.Placar.PlacarBox.PlayerImage.image, Game.Placar.PlacarBox.PlayerImage.x, Game.Placar.PlacarBox.PlayerImage.y)

        love.graphics.setColor(1,1,1)
        love.graphics.draw(Game.Options.Rock.image, Game.Options.Rock.x, Game.Options.Rock.y)
        love.graphics.draw(Game.Options.Paper.image, Game.Options.Paper.x, Game.Options.Paper.y)
        love.graphics.draw(Game.Options.Cut.image, Game.Options.Cut.x, Game.Options.Cut.y)
    end

    if Game.Result.Visible1 and Game.Visible then

        love.graphics.setFont(Fonts._30)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Game.Result.Text1, Game.Result.x1, Game.Result.y1)
    end

    if Game.Result.Visible2 and Game.Visible then

        love.graphics.setFont(Fonts._30)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Game.Result.Text2, Game.Result.x2, Game.Result.y2)
    end

    if Game.Result.Visible3 and Game.Visible then

        love.graphics.setFont(Fonts._30)
        love.graphics.setColor(0.110, 0.110, 0.110)
        love.graphics.print(Game.Result.Text3, Game.Result.x3, Game.Result.y3)
    end
end

function love.mousepressed(x, y, button, istouch, presses)

    if button == 1 then

        if x >= Start.StartButton.x and x <= Start.StartButton.x + Start.StartButton.width and y >= Start.StartButton.y and y <= Start.StartButton.y + Start.StartButton.height then
            
            Start.Visible = false
            Game.Visible = true
        end

        if x >= Game.BackBox.x and x <= Game.BackBox.x + Game.BackBox.width and y >= Game.BackBox.y and y <= Game.BackBox.y + Game.BackBox.height then
            
            Start.Visible = true
            Game.Visible = false
            Game.Result.Visible2 = false
            Game.Result.Visible3 = false
            Game.Result.Visible1 = false
            Game.Placar.PlacarBox.PointPlayer.text = "0"
            Game.Placar.PlacarBox.PointPc.text = "0"
        end

        if (Game.Visible == true) and x >= Game.Options.Rock.x and x <= Game.Options.Rock.x + 128 and y >= Game.Options.Rock.y and y <= Game.Options.Rock.y + 128 then

            Ver = ia(1)

            if not Ver then

                Game.Result.Visible2 = false
                Game.Result.Visible3 = false
                Game.Result.Visible1 = true

                local PointPc = tonumber(Game.Placar.PlacarBox.PointPc.text)

                PointPc = PointPc + 1

                Game.Placar.PlacarBox.PointPc.text = tostring(PointPc)
            elseif Ver == 2 then

                Game.Result.Visible1 = false
                Game.Result.Visible3 = false
                Game.Result.Visible2 = true

                local PointPlayer = tonumber(Game.Placar.PlacarBox.PointPlayer.text)

                PointPlayer = PointPlayer + 1

                Game.Placar.PlacarBox.PointPlayer.text = tostring(PointPlayer)
            elseif Ver == 1 then

                Game.Result.Visible1 = false
                Game.Result.Visible2 = false
                Game.Result.Visible3 = true
            end
        end

        if (Game.Visible == true) and x >= Game.Options.Paper.x and x <= Game.Options.Paper.x + 128 and y >= Game.Options.Paper.y and y <= Game.Options.Paper.y + 128 then

            Ver = ia(2)

            if not Ver then

                Game.Result.Visible2 = false
                Game.Result.Visible3 = false
                Game.Result.Visible1 = true

                local PointPc = tonumber(Game.Placar.PlacarBox.PointPc.text)

                PointPc = PointPc + 1

                Game.Placar.PlacarBox.PointPc.text = tostring(PointPc)
            elseif Ver == 2 then

                Game.Result.Visible1 = false
                Game.Result.Visible3 = false
                Game.Result.Visible2 = true

                local PointPlayer = tonumber(Game.Placar.PlacarBox.PointPlayer.text)

                PointPlayer = PointPlayer + 1

                Game.Placar.PlacarBox.PointPlayer.text = tostring(PointPlayer)
            elseif Ver == 1 then

                Game.Result.Visible1 = false
                Game.Result.Visible2 = false
                Game.Result.Visible3 = true
            end
        end

        if (Game.Visible == true) and x >= Game.Options.Cut.x and x <= Game.Options.Cut.x + 128 and y >= Game.Options.Cut.y and y <= Game.Options.Cut.y + 128 then

            Ver = ia(3)

            if not Ver then

                Game.Result.Visible2 = false
                Game.Result.Visible3 = false
                Game.Result.Visible1 = true

                local PointPc = tonumber(Game.Placar.PlacarBox.PointPc.text)

                PointPc = PointPc + 1

                Game.Placar.PlacarBox.PointPc.text = tostring(PointPc)
            elseif Ver == 2 then

                Game.Result.Visible1 = false
                Game.Result.Visible3 = false
                Game.Result.Visible2 = true

                local PointPlayer = tonumber(Game.Placar.PlacarBox.PointPlayer.text)

                PointPlayer = PointPlayer + 1

                Game.Placar.PlacarBox.PointPlayer.text = tostring(PointPlayer)
            elseif Ver == 1 then

                Game.Result.Visible1 = false
                Game.Result.Visible2 = false
                Game.Result.Visible3 = true
            end
        end
    end
end