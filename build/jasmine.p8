pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--src/levels.lua
levels = {
    {
        {c = 100, i = 1},
        {c = 300, i = 1},
        {c = 300, i = 1},
        {c = 300, i = 1},
        {c = 400, i = 1},
        {c = 200, i = 1},
    },
    {
        {c = 100, i = 2},
        {c = 400, i = 1},
        {c = 300, i = 2},
        {c = 300, i = 1},
        {c = 200, i = 1},
        {c = 200, i = 1},
    },
    {
        {c = 100, i = 3},
        {c = 400, i = 1},
        {c = 300, i = 2},
        {c = 300, i = 1},
        {c = 200, i = 2},
        {c = 200, i = 2},
    },
    {
        {c = 100, i = 3},
        {c = 300, i = 3},
        {c = 400, i = 2},
        {c = 500, i = 1},
        {c = 2, i = 1},
        {c = 200, i = 1},
    },
    {
        {c = 100, i = 1},
        {c = 2, i = 1},
        {c = 300, i = 3},
        {c = 400, i = 3},
        {c = 500, i = 1},
        {c = 2, i = 2},
        {c = 200, i = 1},
    },
    {
        {c = 100, i = 2},
        {c = 100, i = 2},
        {c = 300, i = 3},
        {c = 200, i = 1},
        {c = 400, i = 1},
        {c = 2, i = 2},
        {c = 200, i = 2},
    },
    {
        {c = 100, i = 1},
        {c = 100, i = 2},
        {c = 200, i = 2},
        {c = 150, i = 3},
        {c = 300, i = 1},
        {c = 200, i = 2},
        {c = 200, i = 2},
        {c = 2, i = 1},
        {c = 25, i = 1},
        {c = 200, i = 2}
    },
    {
        {c = 100, i = 3},
        {c = 80, i = 3},
        {c = 200, i = 3},
        {c = 150, i = 3},
        {c = 350, i = 3},
        {c = 50, i = 1},
        {c = 200, i = 3},
        {c = 25, i = 1},
        {c = 300, i = 3}
    },
    {
        {c = 100, i = 1},
        {c = 20, i = 1},
        {c = 80, i = 1},
        {c = 80, i = 1},
        {c = 350, i = 3},
        {c = 50, i = 1},
        {c = 25, i = 1},
        {c = 50, i = 1},
        {c = 25, i = 1},
        {c = 300, i = 3}
    },
    {
        {c = 100, i = 3},
        {c = 10, i = 2},
        {c = 10, i = 2},
        {c = 200, i = 1},
        {c = 400, i = 3},
        {c = 2, i = 3},
        {c = 200, i = 2},
        {c = 20, i = 2},
        {c = 40, i = 2},
    },
    {
        {c = 100, i = 2},
        {c = 50, i = 3},
        {c = 50, i = 2},
        {c = 50, i = 1},
        {c = 50, i = 2},
        {c = 50, i = 1},
        {c = 50, i = 3},
        {c = 50, i = 2},
        {c = 50, i = 3}
    },
    {
        {c = 100, i = 1},
        {c = 5, i = 3},
        {c = 100, i = 2},
        {c = 5, i = 1},
        {c = 100, i = 2},
        {c = 5, i = 3},
        {c = 100, i = 3},
        {c = 5, i = 3},
        {c = 50, i = 3}
    },
    {
        {c = 100, i = 3},
        {c = 80, i = 3},
        {c = 200, i = 3},
        {c = 150, i = 2},
        {c = 200, i = 3},
        {c = 50, i = 1},
        {c = 200, i = 3},
        {c = 25, i = 1},
        {c = 200, i = 3},
        {c = 100, i = 2},
        {c = 80, i = 3},
        {c = 100, i = 3},
        {c = 150, i = 2},
        {c = 150, i = 3},
        {c = 50, i = 1},
        {c = 100, i = 3},
        {c = 25, i = 1},
        {c = 100, i = 2},
    },
}

level_bonus = {
    50,
    100,
    150,
    200,
    250,
    300,
    350,
    400,
    500,
    600,
    700,
    800,
    900,
    1000,
    1000,
    1000,
    1000,
    1000,
    1000,
    1000,
    1000
}
-->8
--src/items.lua
items = {}

items.bread = {
    name = 'bread',
    s = 164
}

items.cheese = {
    name = 'cheese',
    s = 134
}

items.tomato = {
    name = 'tomato',
    s = 166
}

items.eggplant = {
    name = 'eggplant',
    s = 14
}

items.uncooked_panini = {
    name = 'uncooked_panini',
    s = 224,
    ingredients={}
}

items.cooked_panini = {
    name = 'cooked_panini',
    s = 226,
    ingredients={}
}

items.burnt_panini = {
    name = 'burnt_panini',
    s = 228
}

ingredients = {
    [items.cheese.name] = true,
    [items.tomato.name] = true,
    [items.eggplant.name] = true
}


function new_item(i)
    local copy = {}
    for k,v in pairs(i) do
        copy[k]=v
    end
    return copy
end
-->8
--src/controller.lua
-- game controller

controller = {
    state='move',
    handle_input = function(self)
        if (btnp(0)) then
            -- LEFT
            char:update_position(char.x - 16, char.y)
            char.spr = 005
            char.selection.x = char.x - 16
            char.selection.y = char.y

            check_selection()
        elseif (btnp(1)) then
            -- RIGHT
            char:update_position(char.x + 16, char.y)
            char.spr = 003
            char.selection.x = char.x + 16
            char.selection.y = char.y
            check_selection()
        elseif (btnp(2)) then
            -- UP
            char:update_position(char.x, char.y - 16)
            char.spr = 007
            char.selection.x = char.x
            char.selection.y = char.y - 16
            check_selection()
        elseif (btnp(3)) then
            -- DOWN
            char:update_position(char.x, char.y + 16)
            char.spr = 001
            char.selection.x = char.x
            char.selection.y = char.y + 16
            check_selection()
        elseif (btnp(4)) then
        elseif (btnp(5)) then
            -- pick up / drop (X)

            if (char.holding ~= nil) then
                for obj in all(objects._) do
                    if (char.selection.x == obj.x and char.selection.y == obj.y) then

                        -- can add ingredients to uncooked paninis, but not cooked ones
                        if (obj.name == items.bread.name) then
                            if char.holding.name ~= 'bread' then
                                obj.name = items.uncooked_panini.name
                                obj.s = items.uncooked_panini.s
                                obj.ingredients = {}
                                obj.ingredients[char.holding.name] = true
                                char.holding = nil
                                check_selection()
                            end
                        elseif (obj.name == items.uncooked_panini.name) then
                            if (ingredients[char.holding.name] == true and obj.ingredients[char.holding.name] == nil) then
                                obj.ingredients[char.holding.name] = true
                                char.holding = nil
                                check_selection()
                            end
                        end
                        return
                    end
                end

                -- trays
                if (char.selection.y == 80 and char.selection.x <= 48) then
                    return
                end

                -- trash
                if (char.selection.x == 0 and char.selection.y == 16) then
                    char.holding = nil
                    return
                end

                -- paninis
                for pp in all(panini_presses._) do
                    if (char.selection.x == pp.x and char.selection.y == pp.y - 8) then
                        if (char.holding.name == items.uncooked_panini.name) then
                            pp.item = char.holding
                            char.holding = nil
                        end
                        return
                    end
                end

                objects:new(char.holding, char.selection.x, char.selection.y)
                char.holding = nil
                return
            end

            if (char.holding == nil) then
                -- check objects
                for obj in all(objects._) do
                    if (char.selection.x == obj.x and char.selection.y == obj.y) then
                        char.holding = obj
                        del(objects._, obj)
                        return
                    end
                end

                -- check trays
                if (char.selection.y == 80) then
                    if (char.selection.x == 0) then
                        char.holding = items.bread 
                    elseif (char.selection.x == 16) then
                        char.holding = items.tomato
                    elseif (char.selection.x == 32) then
                        char.holding = items.cheese
                    elseif (char.selection.x == 48) then
                        char.holding = items.eggplant
                    end
                end

                -- check paninis
                for pp in all(panini_presses._) do
                    if (char.selection.x == pp.x and char.selection.y == pp.y - 8) then
                        if (pp.item ~= nil) then
                            char.holding = pp.item
                            pp.item = nil
                            pp.cook_time = 0 
                        end
                        return
                    end
                end

                -- ...
            end
        end
    end,
}

function check_selection()
    for obj in all(objects._) do
        if (char.selection.x == obj.x and char.selection.y == obj.y) then
            if (obj.name == items.uncooked_panini.name or obj.name == items.cooked_panini.name) then
                local i = 0
                for k,v in pairs(obj.ingredients) do
                    balloons:new({
                        x = char.selection.x + (i % 16),
                        y = char.selection.y + (flr(i / 16) * 8),
                        s = balloon_sprites[k]
                    })
                    i += 8
                end
            end
        end
    end
end
-->8
--src/main.lua
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
    state='intro'
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
    title_counter = 0

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

    if (state == 'intro') then

        if (title_counter <= 180) then
            title_counter += 1
        else
            state = 'title'
        end

        intro:update(title_counter)
        for d in all(dust) do
            d:update()
        end

        return
    end

    if (state == 'title') then

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
    camera(0,0)

    if (state == 'intro') then

        intro:draw(title_counter)

        for d in all(dust) do
            d:draw()
        end
        return
    end


    if (state == 'title') then
        draw_background()

        -- local sx, sy = (142 % 16) * 8, flr(142 \ 16) * 8
        -- sspr(sx,sy,16,16,16,-8,112,112)
        -- spr(136,20,40,6,2) 
        --spr(136,64,44,6,2)

        sspr2(142,16,16,12,-10,6.5)

        sspr2(34,16,16,68,28,2)

        sspr2(136,48,16,54,50,1.25)
        sspr2(136,48,16,24,36,1.25)


        sspr2(168,32,16,32,70,1)
        sspr2(172,32,16,64,70,1)


        if (t % 32 > 28) then
            print_centered('press x', 104, 1, 1)
        elseif (t % 32 > 24) then
            print_centered('press x', 104, 13, 1)
        elseif (t % 32 > 20) then
            print_centered('press x', 104, 6, 1)
        elseif (t % 32 > 16) then
            print_centered('press x', 104, 7, 1)
        elseif (t % 32 > 12) then
            print_centered('press x', 104, 6, 1)
        elseif (t % 32 > 8) then
            print_centered('press x', 104, 13, 1)
        elseif (t % 32 > 4) then
            print_centered('press x', 104, 1, 1)
        else
            print_centered('press x', 104, 0, 0)
        end

        -- print_outlined('tutorial', 64, 104, 6, 1)

        print_centered('2022 moonbike games', 120, 6, 1)
        return
    end

    if (state == 'game_over') then
        print('game over', 40, 24, 8)
        spr(009, 49, 40, 2, 2)
        print('score: ' .. score, 24, 64, 7)
        print('high score: ' .. high_score, 24, 72, 9)

        print ('press x to restart', 24, 96, 7)
        return
    end

    draw_background()

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

    -- debug()
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

function draw_background()
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

    if (state ~= 'title' and state ~= 'intro') then
        spr(192,16,0,2,2)
        spr(194,32,0,2,2)
        spr(196,48,0,2,2)
        spr(198,64,0,2,2)
        spr(200,80,0,2,2)
        spr(202,96,0,2,2)
    end

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

    if (state ~= 'title' and state ~= 'intro') then
        print('PORTA VIA', 78, 96, 15)
    end

    -- garbage can
    spr(238,0,24,2,2)

    -- cutting board
    spr(162,24,16,2,2)

    -- counter
    for i=0,3 do
        spr(066,i*16,64,2,2)
    end
end
-->8
--src/intro.lua
intro = {
    objects = {},
    meow1 = {
        x=-80,
        y=36,
        dx=2,
        px=1.25,
        update=function(self)
            if (self.x < 24) then
                self.x += self.dx
                self.dx += 0.4
                add_new_dust_fade(self.x + 16, self.y + 16, 0.2, -rnd(0.5) - 2, 54, rnd(3,4), 0.1, 6)
                add_new_dust_fade(self.x, self.y + 8, 0, -0.2, 12, 3, 0, 10)
            elseif (self.x > 24) then
                dust_explosion(self.x + 52, self.y + 6, 4, 44, 3, 0.2, 10)
                sfx(0)
                self.x = 24
            end
        end,
        draw=function(self)
            sspr2(136,48,16,self.x,self.y,self.px,1.25)
        end
    },
    meow2 = {
        x=120,
        dx=3,
        y=50,
        px=1.25,
        update=function(self)
            if (self.x > 54) then
                self.x -= self.dx
                self.dx += 0.5
                add_new_dust_fade(self.x + 32, self.y + 16, -0.2, -rnd(0.5) - 2, 54, rnd(3,4), 0.1, 6)
                add_new_dust_fade(self.x + 48, self.y + 8, 0, -0.2, 12, 3, 0, 10)
            elseif (self.x < 54) then
                dust_explosion(self.x + 6, self.y + 6, 4, 44, 3, 0.2, 10)
                sfx(0)
                self.x = 54
            end
        end,
        draw=function(self)
            sspr2(136,48,16,self.x,self.y,self.px,1.25)
        end
    },
    panini = {
        x=-60,
        y=70,
        dx=2,
        px=1,
        update=function(self)
            if (self.x < 32) then
                self.x += self.dx
                self.dx += 0.3
                add_new_dust_fade(self.x + 8, self.y + 16, 0.2, -rnd(0.5) - 2, 54, rnd(3), 0.1, 6)
                add_new_dust_fade(self.x, self.y + 8, 0, -0.2, 12, 5, 0, 7)
            elseif (self.x > 32) then
                dust_explosion(self.x + 32, self.y + 8, 4, 44, 3, 0.2, 7)
                sfx(0)
                self.x = 32
            end
        end,
        draw=function(self)
            sspr2(168,32,16,self.x,self.y,self.px,1)
        end
    },
    cafe = {
        x=160,
        y=70,
        dx=2,
        px=1,
        update=function(self)
            if (self.x > 64) then
                self.x -= self.dx
                self.dx += 0.3
                add_new_dust_fade(self.x + 32, self.y + 16, -0.2, -rnd(0.5) - 2, 54, rnd(3,4), 0.1, 6)
                add_new_dust_fade(self.x + 32, self.y + 8, 0, -0.2, 12, 5, 0, 12)
            elseif (self.x < 64) then
                dust_explosion(self.x + 6, self.y + 8, 4, 44, 3, 0.2, 12)
                sfx(2)
                sfx(1)
                self.x = 64
            end
        end,
        draw=function(self)
            sspr2(172,32,16,self.x,self.y,self.px,1)
        end
    },
    circle = {
        x=64,
        y=76,
        r=1,
        dr=1,
        update=function(self)
            self.r += self.dr
            self.dr *= 1.05
        end,
        draw=function(self)
            circfill(self.x,self.y,self.r,7)
        end,
    },
    cat = {
        update=function(self)
        end,
        draw=function(self)
            sspr2(142,16,16,12,-10,6.5)
        end,
    },
    sm_cat = {
        x=-10,
        update=function(self)
            if (self.x < 68) then
                self.x += 8
            elseif (self.x > 68) then
                self.x = 68
                sfx(4)
                dust_explosion(self.x, 68, 19, 14, 3, 0.2, 7)
            end
        end,
        draw=function(self)
            sspr2(34,16,16,self.x,28,2)
        end
    },
    

    update=function(self, _c)
        if (_c == 1) then
            add(self.objects, self.meow1)            
        end 

        if (_c == 32) then
            add(self.objects, self.meow2)            
        end 

        if (_c == 54) then
            add(self.objects, self.panini)
            add(self.objects, self.cafe)
        end

        if (_c > 70 and _c < 120) then
            dust_explosion(64, 76, 19, 14, (_c - 80) / 4, 0.2, rnd({6,7,1,12}))
        end

        if (_c == 80) then
            add(self.objects, self.circle, 1)
        end

        if (_c == 120) then
            del(self.objects, self.circle)
            add(self.objects, self.cat, 1)
            sfx(3)
        end

        if (_c == 138) then
            add(self.objects, self.sm_cat, 2)
        end


        for o in all(self.objects) do
            o:update()
        end
    end,
    draw=function(self,_c)
        if (_c > 150) then
            draw_background()
            print_centered('2022 moonbike games', 120, 6, 1)
        elseif (_c > 120) then
            rectfill(0,0,128,128,7)
        end

        if (_c ~= 149) then
            for o in all(self.objects) do
                o:draw()
            end
        end
    end,
}
-->8
--src/panini.lua
BURN_TIME = 400
WARN_TIME = 320
COOK_TIME = 200

panini_press = {
    s = 106,
    x = nil,
    y = nil,
    w = 2,
    item = nil,
    cook_time = 0,
    update = function(self)
        if (self.item ~= nil) then
            if self.cook_time > BURN_TIME then
                if (t % 8 == 0) then 
                    add_new_dust(rndi(self.x + 2, self.x + 14), self.y, 0, -0.5, 14, 0.6, 0, 5)
                end
            elseif self.cook_time == BURN_TIME then
                self.cook_time += 1
                self.s = 160
                self.item = new_item(items.burnt_panini)


                balloons:new({x = self.x + 4, y = self.y - 4, s = balloon_sprites.fire})
            elseif self.cook_time > COOK_TIME then
                self.cook_time += 1
                if (t % 8 == 0) then 
                    add_new_dust(rndi(self.x + 2, self.x + 14), self.y, 0, -0.5, 12, 0.5, 0, 7)
                end

                if (self.cook_time == WARN_TIME) then
                    balloons:new({x = self.x + 4, y = self.y - 4, s = balloon_sprites.alert})
                end
            elseif self.cook_time == COOK_TIME then
                self.cook_time += 1
                self.s = 110
                local ingredients_copy = self.item.ingredients
                self.item = new_item(items.cooked_panini)
                self.item.ingredients = ingredients_copy

                balloons:new({x = self.x + 4, y = self.y - 4, s = balloon_sprites.done})
            else
                self.cook_time += 1
                self.s = 108
                if (t % 8 == 0) then 
                    add_new_dust(rndi(self.x + 2, self.x + 14), self.y, 0, -0.5, 12, 0.5, 0, 7)
                end
            end
        else
            self.s = 106
        end
    end
}
-->8
--src/balloon.lua
balloon = {
    s = nil,
    x = nil,
    y = nil,
    size = 8,
    w = 1,
    life = 48,
    update = function(self)
        self.y -= 0.5
        add_new_dust(self.x + 4, self.y + 8, 0, 0, 3, 1, 0, 7)
        self.size = ((-cos(self.life / 24) + 1) * 2.5) + 8
        self.life -= 1
        if (self.life == 2) then
            add_new_dust(self.x + 4, self.y +2, 0, 0, 3, 3, 0, 7)
            add_new_dust(self.x + 4, self.y, 0.8, -0.8, 6, 0.6, 0, 6)
            add_new_dust(self.x + 4, self.y, -0.8, -0.8, 6, 0.6, 0, 6)
            add_new_dust(self.x + 4, self.y, -0.8, 0.8, 6, 0.6, 0, 6)
            add_new_dust(self.x + 4, self.y, 0.8, 0.8, 6, 0.6, 0, 6)
        end

        if (self.life <= 0) then
            self.alive = false
        end
    end,
    draw = function(self)
        local sx, sy = (self.s % 16) * 8, flr(self.s \ 16) * 8
        sspr(sx, sy, 8, 8, self.x, self.y, self.size, self.size)
    end,
}

balloon_sprites = {}
balloon_sprites.heart = 128
balloon_sprites.sad = 129
balloon_sprites.tomato = 130
balloon_sprites.cheese = 131
balloon_sprites.eggplant = 132
balloon_sprites.done = 144
balloon_sprites.alert = 145
balloon_sprites.fire = 146
balloon_sprites.waiting = 147
balloon_sprites.mad = 148
-->8
--src/objects.lua
objects = {
    _={},
    new=function(self, item, x, y)
        local copy = {}
        for k,v in pairs(item) do
            copy[k]=v
        end
        copy.x = x
        copy.y = y
        add(self._,copy)
    end,
        
    update=function(self)
        -- for i,v in ipairs(self._) do
        --     v:update()
        --     if v.alive==false then
        --     del(self._,self._[i])
        --     end
        -- end
    end,
    
    draw=function(self)
        for v in all(self._) do
            spr(v.s, v.x, v.y, 2, 2)
        end
    end
}
-->8
--src/lib/group.lua
function new_group(bp)
    return {
        _={},
        bp=bp,
        
        new=function(self,p)
            for k,v in pairs(bp) do
                if v!=nil then
                    p[k]=v
                end
            end
            p.alive=true
            add(self._,p)
        end,
           
        update=function(self)
            for i,v in ipairs(self._) do
                v:update()
                if v.alive==false then
                del(self._,self._[i])
                end
            end
        end,
        
        draw=function(self)
            for v in all(self._) do
                if (v.draw == nil) then
                    spr(v.s,v.x,v.y,v.w,v.w,v.flip)
                else
                    v:draw()
                end
            end
        end
    }
end
-->8
--src/lib/dust.lua
function add_new_dust(_x,_y,_dx,_dy,_l,_s,_g,_f)
    add(dust, {
    fade=_f,x=_x,y=_y,dx=_dx,dy=_dy,life=_l,orig_life=_l,rad=_s,col=_f,grav=_g,draw=function(self)
    pal()palt()circfill(self.x,self.y,self.rad,self.col)
    end,update=function(self)
    self.x+=self.dx self.y+=self.dy
    self.dy+=self.grav self.rad*=1.1 self.life-=1
    if type(self.fade)=="table"then self.col=self.fade[flr(#self.fade*(self.life/self.orig_life))+1]else self.col=self.fade end
    if self.life<0then del(dust,self)end end})
end

function add_new_dust_fade(_x,_y,_dx,_dy,_l,_s,_g,_f)
    add(dust, {
    fade=_f,x=_x,y=_y,dx=_dx,dy=_dy,life=_l,orig_life=_l,rad=_s,col=_f,grav=_g,draw=function(self)
    pal()palt()circfill(self.x,self.y,self.rad,self.col)
    end,update=function(self)
    self.x+=self.dx self.y+=self.dy
    self.dy+=self.grav self.rad*=0.9 self.life-=1
    if type(self.fade)=="table"then self.col=self.fade[flr(#self.fade*(self.life/self.orig_life))+1]else self.col=self.fade end
    if self.life<0then del(dust,self)end end})
end

function dust_explosion(_x,_y,_force,_l,_s,_g,_f)
        -- add_new_dust_fade(_x, _y, -1, -1, 44, 6, 0.2, 10)
    for d=1,24 do
        add_new_dust_fade(_x + rnd2(4), _y + rnd2(4), rnd2(_force), rnd2(_force) - 1, _l, _s, _g, _f)
        -- add_new_dust_fade(_x, _y, rnd(-2, 2), rnd(-2, 2), _l, rnd(_s, _s-2), _g, _f)
    end
end
-->8
--src/lib/util.lua
function rndi(min,max)
    return flr(rnd(max - min)) + min
end

function rnd2(num)
    return rnd(num) - (num/2)
end


function coord_match(a,b)
    return a[1] == b[1] and a[2] == b[2]
end

function in_bounds(a,b)
    return a > 0 and a < MAP_SIZE + 1 and b > 0 and b < MAP_SIZE + 1
end

function round(x)
    if ((x - flr(x)) >= 0.5) then
        return ceil(x)
    else
        return flr(x)
    end
end

function print_centered(str, y, col, col2)
    print_outlined(str, 64 - (#str * 2), y, col, col2) 
end

function print_outlined(str, x, y, col, border_col)
    print(str, x - 1, y - 1, border_col)
    print(str, x, y - 1, border_col)
    print(str, x + 1, y - 1, border_col)
    print(str, x + 1, y, border_col)
    print(str, x + 1, y + 1, border_col)
    print(str, x, y + 1, border_col)
    print(str, x - 1, y + 1, border_col)
    print(str, x - 1, y, border_col)
    print(str, x, y, col)
end

function sspr2(spr,w,h,x,y,px,_py)
    local py = _py
    if _py == nil then py = px end

    local sx, sy = (spr % 16) * 8, flr(spr \ 16) * 8
    sspr(sx,sy,w,h,x,y,w*px, h*py,fh,fv)
end
-->8
--src/log.lua
_log={}
log_l=4
for i=1,log_l do
    add(_log,'')
end

function hlog(str)
    hud:set_msg(str, '')
end

function log(str)
    add(_log,str)
end
   
function debug()
    vars = {
        't='..t
    }

    -- draw the log
    for i=count(_log)-log_l+1,count(_log) do
        add(vars,'> '.._log[i])
    end

    for i,v in ipairs(vars) do
        print(v,(cam.x*8)+8,(cam.y*8)+(i*8),15)
    end
end
-->8
--src/char.lua
function init_char()
    local char={
        x=16,
        y=32,
        spr=001,
        spri=0,
        state='base',
        flip=false,
        selection={
            x=16,
            y=48
        },
        holding=nil,
        selection_a={230,230,230,230,230,230,232,232,232,232,234,234,236,236,236,230,230,230,230,230,230,64,64,64,64,64,64,64,64,230,230,230},
        update_position=update_position,
        update=update_char,

        draw=function(self)
            spr(self.spr, self.x, self.y, 2, 2, self.flip)
        end,

        draw_selection=function(self)
            spr(self.selection_a[(t%32) + 1], self.selection.x, self.selection.y, 2, 2)
            -- if (t%16 > 8) then
            --     spr(232, self.selection.x, self.selection.y, 2, 2)
            -- end
            if (self.holding) then
                spr(self.holding.s, self.x, self.y - 8, 2, 2)
            end
        end,
    }
    return char
end


function update_char(_char)
end

function update_position(_char, x, y)
    if (x >= 0 and x < 128 and y >= 32 and y <= 64) then
        _char.x = x
        _char.y = y
    else
    end
end
-->8
--src/customers.lua
customer = {
    x=-16,
    y=nil,
    flip=false,
    s=nil,
    a=nil,
    spri=0,
    choices=nil,
    w=2,
    order_point=nil,
    order_time=0,
    wait_point=64,
    pace_timer=0,
    order=nil,
    fed=false,
    patience=1000,
    max_patience=1000,
    state='enter',
    update=function(self)
        if (self.x > 128) then
            self.alive = false
        end

        if (self.state == 'enter') then
            self.x += 1 
            if (t%4 == 0) then
                self.spri = (self.spri + 1) % #self.a
                self.s = self.a[self.spri+1]
            end

            if (self.x >= self.order_point) then
                self.order_time = rndi(6,120)
                self.state = 'order'
            end


        elseif (self.state == 'order') then
            self.order_time -= 1
            if (self.order_time <= 0) then
                self:make_order()
                self.wait_point = { x = rndi(64,112), y = rndi(92,118) }
                self.state = 'move_to_wait'
            end

        elseif (self.state == 'move_to_wait') then
            if (t%8 == 0) then
                self.spri = (self.spri + 1) % #self.a
                self.s = self.a[self.spri+1]
            end

            if (self.x - self.wait_point.x < -1) then
                self.x += 0.5
                self.flip = false
            elseif (self.x - self.wait_point.x > 1) then
                self.x -= 0.5
                self.flip = true
            end

            if (self.y - self.wait_point.y < -1) then
                self.y += 0.5
            elseif (self.y - self.wait_point.y > 1) then
                self.y -= 0.5
            end

            if (abs(self.x - self.wait_point.x) < 2 and abs(self.y - self.wait_point.y) < 2) then
                self.wait_point = nil
                self.state = 'wait'
            end

        elseif (self.state == 'wait') then
            self.patience -= 1

            -- check the counter for edible objects
            for obj in all(objects._) do
                if (obj.y == 80 and obj.name == items.cooked_panini.name) then
                    if (order_match(obj.ingredients, self.order)) then
                        if (self.y > 88) then
                            self.y -= 1
                        end
                        if (self.x <= obj.x) then
                            self.x += 1
                        else
                            self.x -= 1
                        end


                        if (abs(self.x - obj.x) < 5 and abs(self.y - obj.y) <= 8) then
                            add_new_dust(self.x,self.y,1,-1,9,0.5,0.3,4)
                            add_new_dust(self.x,self.y,-1,-1,9,0.5,0.3,4)
                            add_new_dust(self.x,self.y,1,-1.5,9,0.5,0.3,4)
                            add_new_dust(self.x,self.y,-1,-1.5,9,0.5,0.3,4)
                            del(objects._, obj)
                            balloons:new({x = self.x + 6, y = self.y - 6, s = balloon_sprites.heart})
                            self.fed = true

                            local base_score = 6 + (#self.order * 3)
                            local bonus_score = round((self.patience / self.max_patience) * 10)

                            score_counter += base_score + bonus_score
                            self.state = 'leave'
                        end
                        return
                    end
                end
            end

            -- pace
            if (self.wait_point == nil) then
                if (self.pace_timer <= 0) then
                    self.wait_point = { x = rndi(60,118), y = rndi(92,118) }
                else
                    self.pace_timer -= 1
                end
            else
                if (t%8 == 0) then
                    self.spri = (self.spri + 1) % #self.a
                    self.s = self.a[self.spri+1]
                end

                if (self.x - self.wait_point.x < -1) then
                    self.x += 0.5
                    self.flip = false
                elseif (self.x - self.wait_point.x > 1) then
                    self.x -= 0.5
                    self.flip = true
                end

                if (self.y - self.wait_point.y < -1) then
                    self.y += 0.5
                elseif (self.y - self.wait_point.y > 1) then
                    self.y -= 0.5
                end

                if (abs(self.x - self.wait_point.x) < 2 and abs(self.y - self.wait_point.y) < 2) then
                    self.wait_point = nil
                    self.pace_timer = rndi(40,100)
                end
            end

            if (self.patience == 0) then
                balloons:new({x = self.x + 6, y = self.y - 6, s = balloon_sprites.mad})
                stars -= 1
                screen_shake = 1
                add_new_dust(120,32 + (8 * (max_stars - stars)), -2, -1, 12, 1, 0.3, 10)
                self.state = 'leave'
            elseif ((self.patience / self.max_patience) == 0.25) then
                self.wait_point = nil
                self.pace_timer = rndi(40,100)
                balloons:new({x = self.x + 6, y = self.y - 6, s = balloon_sprites.sad})
            elseif ((self.patience / self.max_patience) == 0.5) then
                self.wait_point = nil
                self.pace_timer = rndi(40,100)
                self:display_order()
            elseif ((self.patience / self.max_patience) == 0.75) then
                self.wait_point = nil
                self.pace_timer = rndi(40,100)
                balloons:new({x = self.x + 6, y = self.y - 6, s = balloon_sprites.waiting})
            end

        elseif (self.state == 'eat') then



        elseif (self.state == 'pay') then



        else
            self.x += 1
            self.flip = false
            if (t%4 == 0) then
                self.spri = (self.spri + 1) % #self.a
                self.s = self.a[self.spri+1]
            end
        end
    end,

    make_order=function(self)
        self._ingredients = {
            items.cheese.name,
            items.tomato.name,
            items.eggplant.name
        }

        self.order = {}

        while self.choices > 0 do
            local ing_select = rnd(self._ingredients)
            add(self.order, ing_select)
            del(self._ingredients,  ing_select)
            self.choices -= 1
        end

        self:display_order()
    end,

    display_order=function(self)
        local i = 1
        for order_item in all(self.order) do
            balloons:new({
                x = self.x + 6,
                y = self.y - (8 * i),
                s = balloon_sprites[order_item],
                life = 40 
            })
            i += 1
        end
    end,

    draw=function(self)
        rectfill(self.x + 2, self.y + 12, self.x + 12, self.y + 13, 1)
        spr(self.s, self.x, self.y, 2, 2, self.flip)
    end
}

function order_match(ing, order)
    for o in all(order) do
        if ing[o] == nil then
            return false
        end
    end

    for k,v in pairs(ing) do
        local found = false
        for o in all(order) do
            if k == o then
                found = true
            end
        end

        if found == false then
            return false
        end
    end 

    return true
end

customer_colors = {
    032, 036, 040, 044
}
-->8
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005000000000050000000000000500000000500000000000000500000000500000000000000000000000000000000000000000000000000000000000
00700700005000444700050000000000000544000044500000000000000500000000500000000000000000000000000000000000000000000004500000030000
00077000005574447777550000000000004577400477540000000000000054477775000000500000000005000000000000000000000000000045550000030000
00077000000777777777700007744444487777744777778444444770000444447744400000500044470005000000000000000000000000000055550000330000
00700700004771777717740057444444487771744717778444444475004f444444f4440000557444777755000000000000000000000000000005100006d30000
0000000000477177771774004444444778477174471774877444444400444444544444000007777777777000000000000000000000000000000510000dd50000
0000000000477777777774004477744774877775577778477447774400444444544444000007777777777000000000000000000000000000000000006dd50000
000000000044777557774400447774444487777777777844444777440077444454444400000771177117700000000000000000000000000000000006ddd50000
00000000000477222277400044777444448477244277484444477744000744454444400000477777777774000000000000000000000000000000006ddd510000
0000000000048772277440004444444444847440044748444444444400044444444440000444777557774440000000000000000000000000000006ddd5100000
000000000004488aa884400044446666444a40000004a444666644440004446666444000044477722777444000000000000000000000000000006dddd1000000
00000000000444666644400044666666446000000000064466666644000440000004400004448777777844400000000000000000000000000000dddd10000000
0000000000044006600440004406666644000000000000446666604400044000000440000444588aa885444000000000000000000000000000001dd100000000
00000000000440000004400044000000440000000000004400000044000440000004400004555566665555400000000000000000000000000000000000000000
00000000000550000005500055000000550000000000005500000055000550000005500000554446644455000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600000000606006000000000060600007000000007070070000000000707000090000000090900900000000009090000500000000505005000000000050500
06600066000666600600006600066660077000770007777007000077000777700990004900099990090000490009999005500055000555500500005500055550
060066666606161006006666660616100700777777071710070077777707171009004949490919100900494949091910050055555505c5c0050055555505c5c0
0d666666666666600d66666666666660067777777777777007777777777777700499494949499990099949494949999001555555555555500555555555555550
00d666666666d00000d666666666d000006777777777600000677777777760000049499999494000004949999949400000155555555510000015555555555000
000666ddd6660000000666ddd6660000000777666777000000077766677700000009994449990000000999444999000000055511155500000005551115550000
00066d000d660000000d6600006d0000000776000677000000067700007600000009940004990000000499000094000000055100015500000001550000510000
00060d00000d6000000d06000660d000000706000006700000060700077060000009040000049000000409000990400000050100000150000001050005501000
00060d00000d600000d000600600d000000706000006700000600070070060000009040000049000004000900900400000050100000150000010005005001000
00060d00000d000000d000600600d000000706000006000000600070070060000009040000040000004000900900400000050100000100000010005005001000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddddddddddd2222222277777777777777777777777644444444444444440444444444444444dddddddddddddddddddddddddddddddd
0000000000000000d000d0000000000d22222222777777777767777777777676f77fffffffffffff4fffffffffffffffd55555555555555dd55555555555555d
0000000000000000d00000000000000d22222222777777777777777777777776ffffff777777ffff4fffff77777fffffd00000d00000000dd00000000000000d
0000000000000000d0d00000d0000d0d22222222777777777777777777777776ffffffffffffffff4f7fffffffffffffd0fff500f4f4000dd08800d00008800d
0000000000000000d00000000000000d22222222777777777777777777777776ffffffffffffffff4fffffffffffffffd6f4d56f4f45666dd68828828828826d
0000000000000000d00000d0000d000d22222222777777777777777777777776ffffffffffffffff4ffffffffff777ffd6fff5f4f4566ffdd822d882881d238d
0000000000000000d00000000000000d22222222777777777777777777777776ffffffffffffffff4fffffffffffffffd6d445ff4566fffdd88821212221888d
0000000000000000dddddddddddddddd22222222777777777777777777777776ffffffffffffffff44ffffffffffffffd6fff5f4d66fff4dd1d812182d22888d
0000000000000000d66666666666666d7777777722222222777777777777777644444444444444445444444444444444d6f4456666ffd46dd22221222122121d
0000000000000000d6d6666d666d666d7777777722222222777777777777777644444444444444445544444444444444d0fff5d00fff400dd000000d000000dd
0000000000000000d66666666666666d7777777722222222777777777777777644444444444444445544444444444444d000000000d0000dd00b30b30bb30b3d
0000000000000000d6666d666d66666d7777777722222222777777777777777644444444444444441554444444444444d5ffdff4ff4fff4dd3b33db35b33d33d
0000000000000000d66666666666666d7777777722222222777777777777777644444444444444441554444444444444d5f44f44d44ff44dd3b33b33b333b33d
0000000000000000d66d66666666666d7777777722222222776777777777767644444444444444441155444444444444d5df4ff4ff4fff4dd3bd5b35b3d5b35d
0000000000000000d66666666666666d7777777722222222777777777777777655555555555555550115555555555555d55555555555555dd55555555555555d
0000000000000000dddddddddddddddd7777777722222222766666666666666611111111111111110011111111111111dddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddd54444444444444411111111111555511dddddddddddddddd000666666666600000000000000000000000000000000000
d55555555555555dd55555555555555d45cccccccccccc4155555555555555557777777777777777000515151515100000000000000000000000000000000000
d0000000d000000dd00000000000000d455ccccccccccc4144441555544444147777777777777777000515151515100000006666666600000000666666660000
d00000000000000dd044d0000444000d9c55cccccccccc4155551555545555147777777777777777000051515151000000055555555550000005555555555000
d666aad6666aaa6dd44466ffd44466fd95c5cccccccccc41111114444111111177777777777777770000111111110000000ffffffffff0000004444444444000
d6aaa9a66ad99a6dd6d556f55645565d4c55cc77777ccc4155555455551555557777777777777777000555555555500000055555555550000005555555555000
d6a9daa66a9aaa6dd6555fd544655dfd45c5c77777cccc4155555111111555557777777777777777000666666666600000066666666660000006666666666000
d6aaa9a6daaa9a6dd665ff564446f5fd4555ccccccccc54144144444155554447777777777777777000050000005000000005000000500000000500000050000
d6d666666666666dd666df66446d6f6d4555dc11cdcc55415514555515555455dddddddddddddddd000000000000000000000000000000000000000000000000
d00000d888000d0dd00003000300000d4555d1111dcc524111111111155551116666666666666666000000000000000000000000000000000000000000000000
d00008fff880000dd0d00d000d00300d4555d1111ddd21415555555555555555d666d6d666d6d666000000000000000000000000000000000000000000000000
d555d7f7788d555dd5556d556d55d55d955531111dd21f4154444415544444156d6d666d6d666d6d000000000000000000000000000000000000000000000000
d55557788825555dd556dd56d556d5dd955533111d21ff415455551554555515d6d6d6d6d6d6d6d6000000000000000000000000000000000000000000000000
d5d557888d25555dd55dd55dd56dd55d45513331121fff415111111551111115dd6d6ddd6d6ddd6d000000000000000000000000000000000000000000000000
d55555555555555dd555555555dd555d4513333333fff3414441444441555544d6ddd6d6ddd6d6dd000000000000000000000000000000000000000000000000
dddddddddddddddddddddddddddddddd54444444444444415551455551555545dddddddddddddddd000000000000000000000000000000000000000000000000
07777770077777700777777007777770077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7e8288277717717773887777777799a7755573770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
788e88277717717778882b3777799aa775557d7700000000000000000079000000aa0aaa0aaa500000aaaa5000aaa500aaa50aa50aa500000010000000000100
78e88827777777777888b3377799a9a77757dd7700000000000000007aa9100000aaaaaaaaaaa5000aaaaaa5aaaaaa50aaa50aa50aa500000111000000001110
778e827677711776772b3376799aaaa6777ddd76000000000000007aaaaa900000aaa5aaa50aa500aa500aa5aa500aa5aaa50aa50aa5000001d1100000011d10
7778277677177176777377767777777677ddd7760000000000007aaaaaaa910000aa500aa50aaa50aa550aa5aa500aa5aaa50aa50aa5000001dd11111111dd10
077777600777776007777760077777600777776000000000000a99999999990000aa500aa500aa5aaa5aaa0aa5000aa50aa50aa50aa5000001ddd111111ddd10
000060000000600000006000000060000000600000000000000aaaaaaaaaa90000aa500aa500aa5aaaaaa00aa5000aa50aa50aa50aa500000111111111111110
077777700778877005555550077777700888888000000000000a9aaaa99aa90000aa500aa500aa5aaaa5000aa5000aa50aa5aaa50a5000001111111111111111
77777b377788827755559555777777778728882800000000000aaaaaa99aa90000aa500aa500aa5aaa5000a5aa500aa50aaaaaaaaa5000001111111111111111
7777b377778882775599a9557777777788228228000000000000aa9aaaaaa90000aa500aa50aaa50aa500aa5aaaaaaa500aaa5aaaa5000001111111111111111
7bb7b37777782777559aa955771717178888888800000000000aaaaaaaa9a90000aa50aaa50aaa50aaaaaa50aaaaaa5000aaa50aa50000001111111111111111
7bbb377677777776558aa955777777768882228800000000000aaaaaaaaaa90000aa50aaa50aa5000aaaa50000aaa500000a500a500000001111111111111111
77bb3776777827765588885577777776882888280000000000011111111111000000000000000000000000000000000000000000000000000111111111111110
07777760077777600555555007777760088888800000000000000000000000000000000000000000000000000000000000000000000000000011111111111100
00006000000060000000500000006000000080000000000000000000000000000000000000000000000000000000000000000000000000000001111111111000
00000000000000000ffffffffffffff1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000ff6ffffff6ff6f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006666666600000f66ff66f66ff6f100000000000000000000000000000000000000000000000000000700000000700000000000000000000cc00000000000
00055555555550000f66ff66f66ff6f10000000000000000000000000000000007777000000000770000070077000070000000000000000000ccc00000000000
00011111111110000f66ff66f66ff6f1000000000fff000000000003000000000770770077700077770000007777000000000000000000000cc0000000000000
00055555555550000f66ff66f66ff6f10000000ff4fff00000000088203331000700070070770077077007007707707000000ccc00ccc000cccc00ccc0000000
000666666666600001161115116116110000004fff4f4000000008e88233b100070007000007007007700700700770700000cc0c00c0cc000cc00cc0cc000000
0000500000050000000510051051051000000ff4fff4500000000888823b3300070077000777707007700700700770700000c00000000c000cc00c00cc000000
0000000000000000000510000051051000004fff4f4500000000088822b3330007777000700770700770070070077070000cc000000cccc00cc0ccccc0000000
00000000000000000000000000000000000ff4fff4500000000000822333310007000007700770700770070070077070000cc00000c00cc00cc0ccc000000000
00000000000000000000000000000000000fff4f45000000000000bb3331100007000007770770700770070070077070000cc00cc0c00cc00cc0cc000c000000
0000000000000000000000000000000000f4ff445000000000000b3331100000070000007777707007700700700770700000ccccc0cc0cc00cc00ccccc000000
0000000000000000000000000000000000044445000000000000b311000000000000000000000000000007700000007700000ccc00ccccc00cc000ccc0000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055000000550000000000000000000
077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770005005000057a5000000000000000000
07677777000000000000000000000000000000000000000000000000000000000000000000000000000000000777767055000011557aa9510000000000000000
0777777777777000000000000000000000000000000000000000000000000000000000000000000000777777777777705000000157aaaa910000000000000000
0077777777777777777777000000000000000000000000000000000000000000000000000777777777777777d77777700500001005aaaa100000000000000000
00077777778787777777777777777000000000000000000000000000000000000777777777777777d777dd77d7777710500000015aa99a910000000000000000
000077777787878887888777777777777777777777777777777777777777777777777777d7d77d7d7d7d77d7d7777100100110011a9119910000000000000000
000007777788878787878788878787737777337733377773377737737377ddd7d777dd7ddddd7d7d7d7ddd777777100001100110011001100000000000000000
0000007777878788878887878787873737373737737373737373737373777d7ddd7d777d7d7d7d7d7d7d7777d771000005555555655555555555555555555550
0000000777878787878777888778773377373337737373737373337737777d7d7d77d77d7d7d7d7d7d77dd777110000056666666611111111111111111111115
0000000007777777778777877787773737373737737333737373737737777d7ddd777d7d777d7d7d777777771000000056511111111111111111111111111115
00000000000000777777778778777733773737737373737337737373777dd77d7d777d7d77777777777777710000000056511111111111111111111111111115
000000000000001111111777777777777777777777777777777777777777777d7d7dd77777777777711111100000000056511111111111111111111111111115
00000000000000000000111111111177777777777777777777777777777777777777777771111111000000000000000056811111111111111111111111111115
00000000000000000000000000000111111111111111111111111111111111111111111110000000000000000000000056611111111111111111111111111115
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555550
00000000000000000000000000000000000000000000000088800000000008880000000088888800000088888822220000888822000000000000777666660000
0000000fdf0000000000000fd4000000000000041500000080000000000000080000000000000000000000000000000000000000000000000077161616156600
000000f83df00000000000f83d400000000000421150000080000000000000088000000000000000000000000000000000000000000000080761515151515560
00000ff77ddf000000000f477dd44000000004599115500000000000000000008000000000000000200000000000000000000000000000087111111111111156
0000ffff783dff00000764f4783d4400000045449211550000000000000000008000000000000000200000000000000800000000000000087111111111111166
000ffffff7883df00007764f47883d40000454555922155000000000000000008000000000000000200000000000000800000000000000087111111111111156
00ffffffff7a83df00662774f47a83d4004545554599215500000000000000008000000000000000200000000000000800000000000000027711111111111d65
0fffffffffff783f072266274f4f7834045455455554921500000000000000000000000000000000800000000000000800000000000000026777111111117661
fffffffffffff7f47722776274f4f7f445455555545549f500000000000000000000000000000000800000000000000800000000000000000677777777777661
ffffffffffffff4022772276274f4f405454545455554450000000000000000000000000000000088000000000000002200000000000000006773377bb377651
4ffffffffffff410627722776774f410554555555554451000000000000000000000000000000008800000000000000220000000000000000177333bbb376611
04ffffffffff41000622772266664100055454554544510000000000000000000000000000000008800000000000000280000000000000000067733bb3776511
004ffffffff410000062772277661000005544555445100000000000000000000000000000000008000000000000000280000000000000000067777b77766110
00004fffff4100000006627722610000000054554451000080000000000000080000000000000008000000000000000080000000000000000017777b77765100
000004fff41000000000067766100000000005454510000080000000000000080000000000000000000000000000000080000000000000000006777777651000
00000044410000000000006661000000000000555100000088800000000008880088888800000000000222228888800000000000022888800001566666510000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4f4f4f4f4f4f4f4f4f4f4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4a4949494949494949474f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d45464646454645464b4949494700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d46454646464546455d5e5f5f4b49494949494949494947000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d45464546464645465e5d5f5f5f5f5f5e5d5e5f5d5e5f48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d46454645454645454a494949475f5f5f5e5d5f5e5d5d48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546454545464646484f004f4d5e5f5f5f5f5f5f5e5d48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464546454646484f004f4d5d5f5f5f5f5f5f5f5e48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546464645464546484f00004d5f5f5f5f5f5f5f5f5f48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464646454645484f00004d5d5f5f5f5f5f5f5f5f48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546454646464546484f00004d5e5d5d5f5f5f5d5f5d48000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464545464545484f00004b4e4e4e4e4e4e4e4e4e4c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546454545464646484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464546454646484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546464645464546484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464646454645484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4546454646464546484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4d4645464545464545484f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4b4e4e4e4e4e4e4e4e4c4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000004f4f4f4f4f4f4f4f4f4f4f4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200000b0500a7500875007750057500475003750037500275001750007500075005700007500075000700057000075000750007000570004700047000370002700017000f5000550005500055000550005500
0005000000010000100001000010000100001000010000200002001020010200202003020030300403005030060300703008030090300a0300b0300d0300e0301003012040140401604017040180401a0401b040
0005000013531105310f5300c5330b5500a55009550085530755306553065530655306553065530655306553075530755308553085530955309553095530a5530c5530e553115531455317553195531e55324553
0002000007124071210712107150091500b1540f1331112515154191511f15124150241502415423153211551b1541b15117151161500e150101540c1530c1550c1500a150091500715005150031500315016105
00040000055043735037420373002c3002c300373402d3002d3002a3002b100373302b1002b1002b1002a1052910437320341001c7001c7001c700373101c7001c7001c7001c7001c7001c7001c7001c7001c705
000300003255429550225501b550165500b5500255000650237002370023700237002370023700237002370523704237002370023700237002370023700237002370023700237002370023700237002370023705
00010000090330c0350e0340f0351203516035190341a0351c03320030220352403525035270352b0352e03531033350353803539035190050b0050a005390050900308005390150500504005380053901539005
011200001f7341f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7351f7341f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f7301f735
011100002305033000240502400023050000001f050000001c050000001a050000001c0541c0501c0501c0551f000000001f0541f0501f0501f0552100000000210542105021051210001f0541f0401f0301f020
011000002f0501770430050240002f050000002b050000002f0501c0002b0501c000240501f000230501f0002305033000240502400023050000001f050000001c0541c0501c0501c0551a0541a0501a0501a055
011000001c0500000000000000001f000000001f0500000000000210000000000000210500000000000000001f050000000000000000000000000000000000002305033000240502400023050000001f05000000
011000001c0500000000000000001f000000001f05000000000000000000000000002305000000000002300023050000002405000000000000000000000000002405000000260500000028050000002405000000
0110000026050000000000000000000000000024050000000000000000000000000021050000001f000000001f050000002105000000000000000000000000002405000000260500000028050000002405000000
0110000026050000000000000000000000000024050000000000000000000000000021050000002b0500000028050000000000000000000000000000000000002305033000240502400023050000001f05000000
011000000406300000241000406300000000000406300000106330000000000040630400000000040630406304063000000000004063000000000004063000001063300000000000400004063000000400004063
__music__
01 43444547
00 43444746
00 43444546
02 43444746
00 45424644
00 45424644
00 45424644
02 41424644
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 49424344
01 4a4e4344
00 4c4e4344
00 4c4e4344
02 4d4e4344

