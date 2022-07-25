balloon = {
    s = nil,
    x = nil,
    y = nil,
    size = 8,
    w = 1,
    life = 48,
    update = function(self)
        self.y -= 0.5
        self.size = ((-cos(self.life / 24) + 1) * 2.5) + 8
        self.life -= 1
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
balloon_sprites.done = 133
balloon_sprites.alert = 134
balloon_sprites.fire = 135
balloon_sprites.money = 136
balloon_sprites.waiting = 137
balloon_sprites.mad = 138