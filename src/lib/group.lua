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