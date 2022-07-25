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