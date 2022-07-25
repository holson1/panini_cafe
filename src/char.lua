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
        update_position=update_position,
        update=update_char,

        draw=function(self)
            spr(self.spr, self.x, self.y, 2, 2, self.flip)
        end,

        draw_selection=function(self)
            if (t%16 > 8) then
                spr(232, self.selection.x, self.selection.y, 2, 2)
            end
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
