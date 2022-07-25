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