local QBCore = nil
local ESX = nil

--------------------------------------------------------------------------------------------------------------
-- Main Framework Functions
--------------------------------------------------------------------------------------------------------------
if SDC.Framework == "qb-core" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif SDC.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end

function GetCurrentBankAmount(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.money['bank']
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getAccount('bank').money
    elseif SDC.Framework == "qbx-core" then
        return exports.qbx_core:GetMoney(src, "bank")
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        return Player.bank
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetCurrentBankAmount", GetCurrentBankAmount)

function RemoveBankMoney(src, amt)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.Functions.RemoveMoney('bank', amt)
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.removeAccountMoney('bank', amt)
    elseif SDC.Framework == "qbx-core" then
        return exports.qbx_core:RemoveMoney(src, "bank", amt)
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        return Player.deductMoney("bank", amt)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework
    end
end
exports("RemoveBankMoney", RemoveBankMoney)

function AddBankAmount(src, amt)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('bank', amt)
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addAccountMoney('bank', amt)
    elseif SDC.Framework == "qbx-core" then
        exports.qbx_core:AddMoney(src, "bank", amt)
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        Player.addMoney("bank", amt)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("AddBankAmount", AddBankAmount)

function GetCurrentCashAmount(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.money['cash']
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getAccount('money').money
    elseif SDC.Framework == "qbx-core" then
        return exports.qbx_core:GetMoney(src, "cash")
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        return Player.cash
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetCurrentCashAmount", GetCurrentCashAmount)

function RemoveCashMoney(src, amt)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney('cash', amt)
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeAccountMoney('money', amt)
    elseif SDC.Framework == "qbx-core" then
        exports.qbx_core:RemoveMoney(src, "cash", amt)
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        Player.deductMoney("cash", amt)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework
    end
end
exports("RemoveCashMoney", RemoveCashMoney)

function AddCashAmount(src, amt)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amt)
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addAccountMoney('money', amt)
    elseif SDC.Framework == "qbx-core" then
        exports.qbx_core:AddMoney(src, "cash", amt)
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        Player.addMoney("cash", amt)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("AddCashAmount", AddCashAmount)

function GetOwnerTag(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            return Player.PlayerData.citizenid
        else
            return nil
        end
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            return xPlayer.identifier
        else
            return nil
        end
    elseif SDC.Framework == "qbx-core" then
        local Player = exports.qbx_core:GetPlayer(src)
        if Player then
            return Player.PlayerData.citizenid
        else
            return nil
        end
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        if Player then
            return Player.identifier
        else
            return nil
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetOwnerTag", GetOwnerTag)

function GetPlayerJob(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.name
        else
            return ""
        end
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.job then
            return xPlayer.job.name
        else
            return ""
        end
    elseif SDC.Framework == "qbx-core" then
        local Player = exports.qbx_core:GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.name
        else
            return ""
        end
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        if Player then
            local name, _ = Player.getJob()
            if name then
                return name
            else
                return ""
            end
        else
            return ""
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetPlayerJob", GetPlayerJob)

function GetPlayerJobGradeName(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.grade.name
        else
            return ""
        end
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.job then
            return xPlayer.job.grade_label
        else
            return ""
        end
    elseif SDC.Framework == "qbx-core" then
        local Player = exports.qbx_core:GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.grade.name
        else
            return ""
        end
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        if Player and Player.jobInfo then
            return Player.jobInfo.rankName
        else
            return ""
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetPlayerJobGradeName", GetPlayerJobGradeName)


function GetPlayerFullName(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.charinfo then
            return Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname
        else
            return ""
        end
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.name then
            return xPlayer.name
        else
            return ""
        end
    elseif SDC.Framework == "qbx-core" then
        local Player = exports.qbx_core:GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.charinfo then
            return Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname
        else
            return ""
        end
    elseif SDC.Framework == "nd-core" then
        local Player = exports["ND_Core"]:getPlayer(src)
        if Player and Player.fullname then
            return Player.fullname
        else
            return ""
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetPlayerFullName", GetPlayerFullName)




--------------------------------------------------------------------------------------------------------------
-- Inventory Functions
--------------------------------------------------------------------------------------------------------------
function GiveItem(src, item, amt)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(item, amt)
            TriggerClientEvent("inventory:client:ItemBox", src, item, "add")
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.addInventoryItem(item, amt)
        elseif SDC.Framework == "qbx-core" then
            exports.ox_inventory:AddItem(src, item, amt)
        elseif SDC.Framework == "nd-core" then
            exports.ox_inventory:AddItem(src, item, amt) 
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        exports.ox_inventory:AddItem(src, item, amt)
    elseif SDC.Inventory == "quasar-inventory" then
        exports['qs-inventory']:AddItem(src, item, amt)
    elseif SDC.Inventory == "mInventory" then
        exports['codem-inventory']:AddItem(src, item, amt)
    end
end
exports("GiveItem", GiveItem)

function RemoveItem(src, item, amt)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            Player.Functions.RemoveItem(item, amt)
            TriggerClientEvent("inventory:client:ItemBox", src, item, "remove")
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.removeInventoryItem(item, amt)
        elseif SDC.Framework == "qbx-core" then
            exports.ox_inventory:RemoveItem(src, item, amt)
        elseif SDC.Framework == "nd-core" then
            exports.ox_inventory:RemoveItem(src, item, amt)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        exports.ox_inventory:RemoveItem(src, item, amt)
    elseif SDC.Inventory == "quasar-inventory" then
        exports['qs-inventory']:RemoveItem(src, item, amt)
    elseif SDC.Inventory == "mInventory" then
        exports['codem-inventory']:RemoveItem(src, item, amt)
    end
end
exports("RemoveItem", RemoveItem)

function HasItemAmt(src, item, amt)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item) and Player.Functions.GetItemByName(item).amount >= amt then
                return true
            else
                return false
            end
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer.getInventoryItem(item) and xPlayer.getInventoryItem(item).count >= amt then
                return true
            else
                return false
            end
        elseif SDC.Framework == "qbx-core" then
            if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) >= amt then
                return true
            else
                return false
            end
        elseif SDC.Framework == "nd-core" then
            if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) >= amt then
                return true
            else
                return false
            end
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) >= amt then
            return true
        else
            return false
        end
    elseif SDC.Inventory == "quasar-inventory" then
        if exports['qs-inventory']:GetItemTotalAmount(src, item) and exports['qs-inventory']:GetItemTotalAmount(src, item) >= amt then
            return true
        else
            return false
        end
    elseif SDC.Inventory == "mInventory" then
        if exports['codem-inventory']:HasItem(src, item, amt) then
            return true
        else
            return false
        end
    end
end
exports("HasItemAmt", HasItemAmt)

function GetItemAmt(src, item)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item) and Player.Functions.GetItemByName(item).amount > 0 then
                return Player.Functions.GetItemByName(item).amount
            else
                return 0
            end
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer.getInventoryItem(item) and xPlayer.getInventoryItem(item).count > 0 then
                return xPlayer.getInventoryItem(item).count
            else
                return 0
            end
        elseif SDC.Framework == "qbx-core" then
            if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) > 0 then
                return exports.ox_inventory:GetItemCount(src, item)
            else
                return 0
            end
        elseif SDC.Framework == "nd-core" then
            if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) > 0 then
                return exports.ox_inventory:GetItemCount(src, item)
            else
                return 0
            end
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        if exports.ox_inventory:GetItemCount(src, item) and exports.ox_inventory:GetItemCount(src, item) > 0 then
            return exports.ox_inventory:GetItemCount(src, item)
        else
            return 0
        end
    elseif SDC.Inventory == "quasar-inventory" then
        if exports['qs-inventory']:GetItemTotalAmount(src, item) and exports['qs-inventory']:GetItemTotalAmount(src, item) > 0 then
            return exports['qs-inventory']:GetItemTotalAmount(src, item)
        else
            return 0
        end
    elseif SDC.Inventory == "mInventory" then
        if exports['codem-inventory']:GetItemsTotalAmount(src, item) and exports['codem-inventory']:GetItemsTotalAmount(src, item) > 0 then
            return exports['codem-inventory']:GetItemsTotalAmount(src, item)
        else
            return 0
        end
    end
end
exports("GetItemAmt", GetItemAmt)

function RegisterUsableItem(item, foodordrink, eventtotrigger, removeitem)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            QBCore.Functions.CreateUseableItem(item, function(source, itemi)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if removeitem then
                    Player.Functions.RemoveItem(item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent("consumables:client:Eat", src, item)
                    else
                        TriggerClientEvent("consumables:client:Drink", src, item)
                    end
                end
            end)
        elseif SDC.Framework == "esx" then
            ESX.RegisterUsableItem(item, function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if removeitem then
                    xPlayer.removeInventoryItem(item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    xPlayer.removeInventoryItem(item, 1)
                    if foodordrink == "food" then
                        TriggerClientEvent('esx_status:add', src, 'hunger', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onEat', src)
                    else
                        TriggerClientEvent('esx_status:add', src, 'thirst', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onDrink', soursrcce)
                    end
                end
            end)
        elseif SDC.Framework == "qbx-core" then
            exports.qbx_core:CreateUseableItem(item, function(source, itemi)
                local src = source
                if removeitem then
                    exports.ox_inventory:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        local ate = lib.callback.await('consumables:client:Eat', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddHunger(src, sustenance)
                    else
                        local ate = lib.callback.await('consumables:client:Drink', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddThirst(src, sustenance)
                    end
                end
            end)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        if SDC.Framework == "qb-core" then
            QBCore.Functions.CreateUseableItem(item, function(source, itemi)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if removeitem then
                    exports.ox_inventory:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent("consumables:client:Eat", src, item)
                    else
                        TriggerClientEvent("consumables:client:Drink", src, item)
                    end
                end
            end)
        elseif SDC.Framework == "esx" then
            ESX.RegisterUsableItem(item, function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if removeitem then
                    exports.ox_inventory:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent('esx_status:add', src, 'hunger', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onEat', src)
                    else
                        TriggerClientEvent('esx_status:add', src, 'thirst', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onDrink', src)
                    end
                end
            end)
        elseif SDC.Framework == "qbx-core" then
            exports.qbx_core:CreateUseableItem(item, function(source, itemi)
                local src = source
                if removeitem then
                    exports.ox_inventory:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        local ate = lib.callback.await('consumables:client:Eat', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddHunger(src, sustenance)
                    else
                        local ate = lib.callback.await('consumables:client:Drink', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddThirst(src, sustenance)
                    end
                end
            end)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "quasar-inventory" then
        if SDC.Framework == "qb-core" then
            QBCore.Functions.CreateUseableItem(item, function(source, itemi)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if removeitem then
                    exports['qs-inventory']:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent("consumables:client:Eat", src, item)
                    else
                        TriggerClientEvent("consumables:client:Drink", src, item)
                    end
                end
            end)
        elseif SDC.Framework == "esx" then
            ESX.RegisterUsableItem(item, function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if removeitem then
                    exports['qs-inventory']:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent('esx_status:add', src, 'hunger', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onEat', src)
                    else
                        TriggerClientEvent('esx_status:add', src, 'thirst', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onDrink', src)
                    end
                end
            end)
        elseif SDC.Framework == "qbx-core" then
            exports.qbx_core:CreateUseableItem(item, function(source, itemi)
                local src = source
                if removeitem then
                    exports['qs-inventory']:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        local ate = lib.callback.await('consumables:client:Eat', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddHunger(src, sustenance)
                    else
                        local ate = lib.callback.await('consumables:client:Drink', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddThirst(src, sustenance)
                    end
                end
            end)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "mInventory" then
        if SDC.Framework == "qb-core" then
            QBCore.Functions.CreateUseableItem(item, function(source, itemi)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if removeitem then
                    Player.Functions.RemoveItem(item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        TriggerClientEvent("consumables:client:Eat", src, item)
                    else
                        TriggerClientEvent("consumables:client:Drink", src, item)
                    end
                end
            end)
        elseif SDC.Framework == "esx" then
            ESX.RegisterUsableItem(item, function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if removeitem then
                    xPlayer.removeInventoryItem(item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    xPlayer.removeInventoryItem(item, 1)
                    if foodordrink == "food" then
                        TriggerClientEvent('esx_status:add', src, 'hunger', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onEat', src)
                    else
                        TriggerClientEvent('esx_status:add', src, 'thirst', math.random(300000, 600000))
                        TriggerClientEvent('esx_basicneeds:onDrink', soursrcce)
                    end
                end
            end)
        elseif SDC.Framework == "qbx-core" then
            exports.qbx_core:CreateUseableItem(item, function(source, itemi)
                local src = source
                if removeitem then
                    exports.ox_inventory:RemoveItem(src, item, 1)
                end
                if eventtotrigger then
                    TriggerEvent(eventtotrigger, item, src)
                else
                    if foodordrink == "food" then
                        local ate = lib.callback.await('consumables:client:Eat', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddHunger(src, sustenance)
                    else
                        local ate = lib.callback.await('consumables:client:Drink', src, nil, nil)
                        if not ate then return end
                
                        local sustenance = math.random(35, 55)
                        exports.qbx_smallresources:AddThirst(src, sustenance)
                    end
                end
            end)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    end
end
exports("RegisterUsableItem", RegisterUsableItem)

function GetInventoryItems(src)
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)

        elseif SDC.Framework == "qbx-core" then
            return exports.ox_inventory:GetInventoryItems(src)
        elseif SDC.Framework == "nd-core" then
            return exports.ox_inventory:GetInventoryItems(src)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.Inventory == "ox_inventory" then
        return exports.ox_inventory:GetInventoryItems(src)
    elseif SDC.Inventory == "quasar-inventory" then

    elseif SDC.Inventory == "mInventory" then
        
    end
end
exports("GetInventoryItems", GetInventoryItems)

function GetSlotFromInventory(src, slot) ---For Custom Resource, Ignore For Regular Users
    if SDC.Inventory == "ox_inventory" then
        return exports.ox_inventory:GetSlot(src, slot)
    end
end
exports("GetSlotFromInventory", GetSlotFromInventory)

function SetItemMetadata(src, item, slot, data)  ---For Custom Resource, Ignore For Regular Users
    if SDC.Inventory == "ox_inventory" then
        return exports.ox_inventory:SetMetadata(src, slot, data)
    end
end
exports("SetItemMetadata", SetItemMetadata)

--------------------------------------------------------------------------------------------------------------
-- Garage Functions
--------------------------------------------------------------------------------------------------------------
function SaveVehicleInDatabase(src, plate, vdata, vmodel)
    if SDC.GarageResource == "framework" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    vmodel,
                    GetHashKey(vmodel),
                    json.encode(vdata),
                    plate,
                    SDC.DefaultGarage
                }
            )
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job, stored, parking, pound, mileage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
                {
                    xPlayer.identifier,
                    plate,
                    json.encode(vdata),
                    "car",
                    "civ",
                    1,
                    nil,
                    nil,
                    0
                }
            )
        elseif SDC.Framework == "qbx-core" then
            local Player = exports.qbx_core:GetPlayer(src)
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fakeplate, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
                {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    vmodel,
                    GetHashKey(vmodel),
                    json.encode(vdata),
                    plate,
                    nil,
                    SDC.DefaultGarage
                }
            )
        elseif SDC.Framework == "nd-core" then
            local Player = exports["ND_Core"]:getPlayer(src)
            MySQL.insert('INSERT INTO nd_vehicles (owner, plate, properties) VALUES (?, ?, ?)',
                {
                    Player.identifier,
                    plate,
                    json.encode(vdata)
                }
            )
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.GarageResource == "qs-advancedgarages" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    vmodel,
                    GetHashKey(vmodel),
                    json.encode(vdata),
                    plate,
                    SDC.DefaultGarage
                }
            )
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            MySQL.insert('INSERT INTO owned_vehicles (owner, tag, plate, vehicle, type, garage, impound_data, favorite, stored) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
                {
                    xPlayer.identifier,
                    nil,
                    plate,
                    json.encode(vdata),
                    "car",
                    SDC.DefaultGarage,
                    nil,
                    nil,
                    1
                }
            )
        elseif SDC.Framework == "qbx-core" then
            local Player = exports.qbx_core:GetPlayer(src)
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fakeplate, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
                {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    vmodel,
                    GetHashKey(vmodel),
                    json.encode(vdata),
                    plate,
                    nil,
                    SDC.DefaultGarage
                }
            )
        elseif SDC.Framework == "nd-core" then
            local Player = exports["ND_Core"]:getPlayer(src)
            MySQL.insert('INSERT INTO nd_vehicles (owner, plate, properties) VALUES (?, ?, ?)',
                {
                    Player.identifier,
                    plate,
                    json.encode(vdata)
                }
            )
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.GarageResource == "lunar_garage" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    vmodel,
                    GetHashKey(vmodel),
                    json.encode(vdata),
                    plate,
                    SDC.DefaultGarage
                }
            )
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job, stored) VALUES (?, ?, ?, ?, ?, ?)',
                {
                    xPlayer.identifier,
                    plate,
                    json.encode(vdata),
                    "car",
                    "civ",
                    1
                }
            )
        elseif SDC.Framework == "nd-core" then
            local Player = exports["ND_Core"]:getPlayer(src)
            MySQL.insert('INSERT INTO nd_vehicles (owner, plate, properties) VALUES (?, ?, ?)',
                {
                    Player.identifier,
                    plate,
                    json.encode(vdata)
                }
            )
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    elseif SDC.GarageResource == "vms_garages" then
        if SDC.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(src)
            exports["vms_garagesv2"]:giveVehicle(src, Player.PlayerData.citizenid, "vehicle", vmodel, plate)
        elseif SDC.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            exports["vms_garagesv2"]:giveVehicle(src, xPlayer.identifier, "vehicle", vmodel, plate)
        elseif SDC.Framework == "qbx-core" then
            local Player = exports.qbx_core:GetPlayer(src)
            exports["vms_garagesv2"]:giveVehicle(src, Player.PlayerData.citizenid, "vehicle", vmodel, plate)
        elseif SDC.Framework == "nd-core" then
            local Player = exports["ND_Core"]:getPlayer(src)
            exports["vms_garagesv2"]:giveVehicle(src, Player.identifier, "vehicle", vmodel, plate)
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    end
end
exports("SaveVehicleInDatabase", SaveVehicleInDatabase)

local letterTable = {
    [1] = "A",
    [2] = "B",
    [3] = "C",
    [4] = "D",
    [5] = "E",
    [6] = "F",
    [7] = "G",
    [8] = "H",
    [9] = "I",
    [10] = "J",
    [11] = "K",
    [12] = "L",
    [13] = "M",
    [14] = "N",
    [15] = "O",
    [16] = "P",
    [17] = "Q",
    [18] = "R",
    [19] = "S",
    [20] = "T",
    [21] = "U",
    [22] = "V",
    [23] = "W",
    [24] = "X",
    [25] = "Y",
    [26] = "Z"
}
function GetRandomPlate()
    if SDC.RandomPlateSettings.UseCustomPlateSetup then
        local newPlate = nil
        repeat
            local tempPlate = ""
            if not newPlate then
                if SDC.RandomPlateSettings.CustomPlateSetup.PutBreakInMiddle then
                    for i=1, SDC.RandomPlateSettings.CustomPlateSetup.TotalPlateLength do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if i ~= 4 then
                            if lorn == 1 then
                                tempPlate = tempPlate..(math.random(1,9))
                            else
                                tempPlate = tempPlate..letterTable[math.random(1,26)]
                            end
                        else
                            tempPlate = tempPlate.." "
                        end
                    end
                else
                    for i=1, SDC.RandomPlateSettings.CustomPlateSetup.TotalPlateLength do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if lorn == 1 then
                            tempPlate = tempPlate..(math.random(1,9))
                        else
                            tempPlate = tempPlate..letterTable[math.random(1,26)]
                        end
                    end
                end
            end
            if SDC.Framework == "qb-core" then
                MySQL.query('SELECT * from player_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
            elseif SDC.Framework == "esx" then
                MySQL.query('SELECT * from owned_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
            elseif SDC.Framework == "qbx-core" then
                MySQL.query('SELECT * from player_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
            elseif SDC.Framework == "nd-core" then
                MySQL.query('SELECT * from nd_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
            elseif SDC.Framework == "custom" then
                --Here is where you would put your custom code for your custom framework

            end

            Wait(500)
        until newPlate
        return newPlate
    else
        if SDC.Framework == "qb-core" then
            local newPlate = nil
            repeat
                local tempPlate = ""
                if not newPlate then
                    for i=1, 8 do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if lorn == 1 then
                            tempPlate = tempPlate..(math.random(1,9))
                        else
                            tempPlate = tempPlate..letterTable[math.random(1,26)]
                        end
                    end
                end
                MySQL.query('SELECT * from player_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
                Wait(500)
            until newPlate
            return newPlate
        elseif SDC.Framework == "esx" then
            local newPlate = nil
            repeat
                local tempPlate = ""
                if not newPlate then
                    for i=1, 7 do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if i ~= 4 then
                            if lorn == 1 then
                                tempPlate = tempPlate..(math.random(1,9))
                            else
                                tempPlate = tempPlate..letterTable[math.random(1,26)]
                            end
                        else
                            tempPlate = tempPlate.." "
                        end
                    end
                end
                MySQL.query('SELECT * from owned_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
                Wait(500)
            until newPlate
            return newPlate
        elseif SDC.Framework == "qbx-core" then
            local newPlate = nil
            repeat
                local tempPlate = ""
                if not newPlate then
                    for i=1, 8 do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if lorn == 1 then
                            tempPlate = tempPlate..(math.random(1,9))
                        else
                            tempPlate = tempPlate..letterTable[math.random(1,26)]
                        end
                    end
                end
                MySQL.query('SELECT * from player_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
                Wait(500)
            until newPlate
            return newPlate
        elseif SDC.Framework == "nd-core" then
            local newPlate = nil
            repeat
                local tempPlate = ""
                if not newPlate then
                    for i=1, 8 do
                        local lorn = 0
                        lorn = math.random(1, 2)
                        if lorn == 1 then
                            tempPlate = tempPlate..(math.random(1,9))
                        else
                            tempPlate = tempPlate..letterTable[math.random(1,26)]
                        end
                    end
                end
                MySQL.query('SELECT * from nd_vehicles WHERE plate = ?', {tempPlate}, function(result)                
                    if not result or not result[1] then
                        newPlate = tempPlate
                    end
                end)
                Wait(500)
            until newPlate
            return newPlate
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
    end
end
exports("GetRandomPlate", GetRandomPlate)

--------------------------------------------------------------------------------------------------------------
-- Vehicle Functions
--------------------------------------------------------------------------------------------------------------
RegisterServerEvent("SDC_CORE:Server:GiveVehKeys")
AddEventHandler("SDC_CORE:Server:GiveVehKeys", function(netid)
    local src = source
    if SDC.Framework == "qbx-core" then
        exports.qbx_vehiclekeys:GiveKeys(src, netid)
    elseif SDC.Framework == "nd-core" then
        exports["ND_Core"]:giveVehicleAccess(src, NetworkGetEntityFromNetworkId(netid), true, {netId = netid})
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end)


--------------------------------------------------------------------------------------------------------------
-- Other Functions
--------------------------------------------------------------------------------------------------------------
function HasBoatLicense(src)
    if SDC.Framework == "qb-core" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.metadata['licences'] and Player.PlayerData.metadata['licences']['driver'] then
            return true
        else
            return false
        end
    elseif SDC.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        TriggerEvent('esx_license:getLicenses', src, function(licenses)
            if licenses and licenses['drive'] then
                return true
            else
                return false
            end
        end)
    elseif SDC.Framework == "qbx-core" then
        if exports.ox_inventory:GetItemCount(src, "driver_license") >= 1 then
            return true
        else
            return false
        end
    elseif SDC.Framework == "nd-core" then
        if exports.ox_inventory:GetItemCount(src, "driver_license") >= 1 then
            return true
        else
            return false
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("HasBoatLicense", HasBoatLicense)


--------------------------------------------------------------------------------------------------------------
-- Discord Functions
--------------------------------------------------------------------------------------------------------------

function SendDiscordWebhook(webhookid, embed)
    if webhookid and Server_SDC.WebhookIds[webhookid] and embed then
        PerformHttpRequest(Server_SDC.WebhookIds[webhookid], function(err, text, headers) end, 'POST', json.encode({username = SDC.WebhookSettings.Username, embeds = embed, avatar_url = SDC.WebhookSettings.AvatarUrl}), { ['Content-Type'] = 'application/json' })
    end
end
exports("SendDiscordWebhook", SendDiscordWebhook)