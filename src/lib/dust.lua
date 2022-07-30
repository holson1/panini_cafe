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