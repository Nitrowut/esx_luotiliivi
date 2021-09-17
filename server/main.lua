ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    ESX.RegisterUsableItem('luotiliivi', function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('esx_item:luotiliivi', source)
            xPlayer.removeInventoryItem('luotiliivi', 1)
    end)