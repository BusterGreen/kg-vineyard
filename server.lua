local KGCore = exports['kg-core']:GetCoreObject()

RegisterNetEvent('kg-vineyard:server:getGrapes', function()
    local Player = KGCore.Functions.GetPlayer(source)
    local amount = math.random(Config.GrapeAmount.min, Config.GrapeAmount.max)
    exports['kg-inventory']:AddItem(source, 'grape', amount, false, false, 'kg-vineyard:server:getGrapes')
    TriggerClientEvent('kg-inventory:client:ItemBox', source, KGCore.Shared.Items['grape'], 'add')
end)

KGCore.Functions.CreateCallback('kg-vineyard:server:loadIngredients', function(source, cb)
    local src = source
    local Player = KGCore.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grapejuice')
    if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 23 then
                exports['kg-inventory']:RemoveItem(src, 'grapejuice', 23, false, 'kg-vineyard:server:loadIngredients')
                TriggerClientEvent('kg-inventory:client:ItemBox', source, KGCore.Shared.Items['grapejuice'], 'remove')
                cb(true)
            else
                TriggerClientEvent('KGCore:Notify', source, Lang:t('error.invalid_items'), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('KGCore:Notify', source, Lang:t('error.invalid_items'), 'error')
            cb(false)
        end
    else
        TriggerClientEvent('KGCore:Notify', source, Lang:t('error.no_items'), 'error')
        cb(false)
    end
end)

KGCore.Functions.CreateCallback('kg-vineyard:server:grapeJuice', function(source, cb)
    local src = source
    local Player = KGCore.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grape')
    if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 16 then
                exports['kg-inventory']:RemoveItem(src, 'grape', 16, false, 'kg-vineyard:server:grapeJuice')
                TriggerClientEvent('kg-inventory:client:ItemBox', source, KGCore.Shared.Items['grape'], 'remove')
                cb(true)
            else
                TriggerClientEvent('KGCore:Notify', source, Lang:t('error.invalid_items'), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('KGCore:Notify', source, Lang:t('error.invalid_items'), 'error')
            cb(false)
        end
    else
        TriggerClientEvent('KGCore:Notify', source, Lang:t('error.no_items'), 'error')
        cb(false)
    end
end)

RegisterNetEvent('kg-vineyard:server:receiveWine', function()
    local Player = KGCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.WineAmount.min, Config.WineAmount.max)
    exports['kg-inventory']:AddItem(source, 'wine', amount, false, false, 'kg-vineyard:server:receiveWine')
    TriggerClientEvent('kg-inventory:client:ItemBox', source, KGCore.Shared.Items['wine'], 'add')
end)

RegisterNetEvent('kg-vineyard:server:receiveGrapeJuice', function()
    local Player = KGCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.GrapeJuiceAmount.min, Config.GrapeJuiceAmount.max)
    exports['kg-inventory']:AddItem(source, 'grapejuice', amount, false, false, 'kg-vineyard:server:receiveGrapeJuice')
    TriggerClientEvent('kg-inventory:client:ItemBox', source, KGCore.Shared.Items['grapejuice'], 'add')
end)
