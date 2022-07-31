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

        sfx(rnd({3,5,6,7,8}))
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