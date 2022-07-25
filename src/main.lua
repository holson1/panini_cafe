-- happy birthday jasmine!

function _init()
    -- global vars
    t=0
    msg=''

    dust={}
    char=init_char()
    customers=new_group(customer)
    panini_presses = new_group(panini_press)
    balloons = new_group(balloon)
    state='start'
    customer_counter = 1
    customer_countdown = 100
    stars = 3
    max_stars = 5
    screen_shake = 0
    screen_wipe = 0
    score = 0
    score_counter = 0
    high_score = 0
    level = 0

    panini_presses:new({x = 80, y = 24})
    panini_presses:new({x = 96, y = 24})
end

function _update()
    pal()
    t=(t+1)%128

    if (stars <= 0 and state == 'play') then
        state = 'screen_wipe'
    end

    if (state == 'screen_wipe') then
        screen_wipe += 1
        if (screen_wipe >= 128) then
            state = 'game_over'
        end
    elseif (state == 'game_over') then
        if score > high_score then
            high_score = score
        end
        if (btnp(5)) then
            restart()
        end
    end

    if (state == 'start') then
        if (btnp(5)) then
            restart()
        end
        return
    end


    if score_counter > 0 then
        score_counter -= 1
        score += 1
    end

    if (state == 'level_complete') then
        if (t == 70) then
            new_level(level + 1)
        end
        if (t > 110) then
            state = 'play'
        end
        return
    end

    if (#customers._ == 0 and customer_countdown == -1) then
        -- the level is over!
        score_counter += level_bonus[level]
        stars += 1
        customer_counter = 1
        customer_countdown = 100
        t = 0
        state = 'level_complete'
    end

    controller:handle_input()

    char:update()

    for d in all(dust) do
        d:update()
    end

    -- level update
    if customer_countdown > 0 then
        customer_countdown -= 1
    end

    if (customer_countdown == 0) then
        local rndy = rndi(92,112)
        local rnds = rnd(customer_colors)

        local customer_data = levels[level][customer_counter]

        customers:new({
            s = {rnds},
            a = {rnds, rnds + 2},
            y=rndy,
            order_point=rndi(16,48),
            choices=customer_data.i
        })
        -- choices=rndi(1,3.5)

        -- get next customer (if there is one)
        customer_counter += 1
        customer_data = levels[level][customer_counter]

        if (customer_data ~= nil) then
            customer_countdown = customer_data.c
        else
            customer_countdown = -1
        end
    end

    objects:update()
    panini_presses:update()
    customers:update()
    balloons:update()

    if (screen_shake == 1) then
        screen_shake = -1
    else
        screen_shake = 0
    end
end

function _draw()
    cls()

    if (state == 'end') then
        camera(0,0)
        print('happy birthday jasmine', 16,16,8)
    else
        camera(0,0)

        if (state == 'game_over') then
            print('game over', 40, 24, 8)
            spr(009, 49, 40, 2, 2)
            print('score: ' .. score, 24, 64, 7)
            print('high score: ' .. high_score, 24, 72, 9)

            print ('press x to restart', 24, 96, 7)
            return
        end

        -- BACKGROUND
        for i=0,8 do
            for j=0,1 do
                spr(102,i*16,j*16,2,2)
            end
        end

        -- windows
        spr(100,0,0,2,2)
        spr(100,112,0,2,2, true)

        -- banner
        spr(192,16,0,2,2)
        spr(194,32,0,2,2)
        spr(196,48,0,2,2)
        spr(198,64,0,2,2)
        spr(200,80,0,2,2)
        spr(202,96,0,2,2)

        -- floor
        for i=0,8 do
            for j=2,5 do
                spr(070,i*16,j*16,2,2)
            end
        end

        -- back counter
        for i=1,8 do
            spr(104,i*16,24,2,2)
        end

        for i=0,8 do
            for j=6,8 do
                spr(068,i*16,j*16,2,2)
            end
        end
        
        spr(076,0,80,2,2)
        spr(078,16,80,2,2)
        spr(096,32,80,2,2)
        spr(098,48,80,2,2)

        -- bar
        spr(074,64,88,2,2)
        spr(072,80,88,2,2)
        spr(072,96,88,2,2, true)
        spr(074,112,88,2,2, true)
        print('PORTA VIA', 78, 96, 15)

        -- END BACKGROUND 

        -- garbage can
        spr(236,0,24,2,2)
        
        -- cutting board
        spr(162,24,16,2,2)

        -- score
        spr(220,96,32,4,1)
        local xmod = 0
        if (score > 9999) then
            xmod = 4
        elseif (score > 999) then
            xmod = 3
        elseif (score > 99) then
            xmod = 2
        elseif (score > 9) then
            xmod = 1
        end

        print(score,123 - (xmod * 4),34,11)

        char:draw()

        -- counter
        for i=0,3 do
            spr(066,i*16,64,2,2)
        end

        char:draw_selection()

        objects:draw()
        panini_presses:draw()
        customers:draw()

        for d in all(dust) do
            d:draw()
        end

        balloons:draw()


        for i=1,max_stars do
            spr(204,120 + screen_shake,(i*8)+32)
        end

        for i=max_stars,(max_stars - stars) + 1,-1 do
            spr(205,120 + screen_shake,(i*8)+32)
        end

        if (state == 'screen_wipe') then
            rectfill(0,0,128,screen_wipe,0)
        end

        if (state == 'level_complete') then
            if (t<50) then
                rectfill(31,48,95,78,1)
                rectfill(32,49,94,77,7)
                print('level complete!', 34, 60, 3)
            elseif (t<70) then
            elseif (t<110) then
                rectfill(31,48,95,78,1)
                rectfill(32,49,94,77,7)
                print('level ' .. level, 50, 60, 3)
            end
        end

        if (state == 'start') then
            rectfill(31,48,95,88,1)
            rectfill(32,49,94,87,7)
            print("butt butt's", 42, 54, 3)
            print("panini cafe", 42, 60, 3)
            print("press x", 48, 78, 3)
        end

        -- debug()
    end
end

function restart()
    t=50

    char=init_char()
    customers=new_group(customer)
    panini_presses = new_group(panini_press)
    balloons = new_group(balloon)
    state='level_complete'
    customer_countdown = 100
    objects._ = {}
    stars = 3
    screen_shake = 0
    screen_wipe = 0
    score = 0
    score_counter = 0
    level = 0
    customer_counter = 1

    panini_presses:new({x = 80, y = 24})
    panini_presses:new({x = 96, y = 24})
end

function new_level(_level)
    char=init_char()
    customers=new_group(customer)
    panini_presses = new_group(panini_press)
    balloons = new_group(balloon)
    objects._ = {}
    level = _level
    screen_shake = 0
    screen_wipe = 0
    customer_countdown = 100

    panini_presses:new({x = 80, y = 24})
    panini_presses:new({x = 96, y = 24})
end