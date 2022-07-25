items = {}

items.bread = {
    name = 'bread',
    s = 164
}

items.cheese = {
    name = 'cheese',
    s = 134
}

items.tomato = {
    name = 'tomato',
    s = 166
}

items.eggplant = {
    name = 'eggplant',
    s = 14
}

items.uncooked_panini = {
    name = 'uncooked_panini',
    s = 224,
    ingredients={}
}

items.cooked_panini = {
    name = 'cooked_panini',
    s = 226,
    ingredients={}
}

items.burnt_panini = {
    name = 'burnt_panini',
    s = 228
}

ingredients = {
    [items.cheese.name] = true,
    [items.tomato.name] = true,
    [items.eggplant.name] = true
}


function new_item(i)
    local copy = {}
    for k,v in pairs(i) do
        copy[k]=v
    end
    return copy
end