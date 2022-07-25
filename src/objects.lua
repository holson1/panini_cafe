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