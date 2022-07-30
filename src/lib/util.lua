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