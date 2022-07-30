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