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

function GetCurrentJob()
    if SDC.Framework == "qb-core" then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData and PlayerData["job"] then
            return PlayerData.job.name
        else
            return ""
        end
    elseif SDC.Framework == "esx" then
        local PlayerData = ESX.GetPlayerData()
        if PlayerData and PlayerData.job then
            return PlayerData.job.name
        else
            return ""
        end
    elseif SDC.Framework == "qbx-core" then
        local PlayerData = exports.qbx_core:GetPlayerData()
        if PlayerData and PlayerData.job then
            return PlayerData.job.name
        else
            return ""
        end
    elseif SDC.Framework == "nd-core" then
        local PlayerData = exports["ND_Core"]:getPlayer()
        if PlayerData and PlayerData.job then
            return PlayerData.job
        else
            return ""
        end
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetCurrentJob", GetCurrentJob)

function GetCurrentJobGrade()
    if SDC.Framework == "qb-core" then
        local PlayerData = QBCore.Functions.GetPlayerData()
        return PlayerData.job.grade.level
    elseif SDC.Framework == "esx" then
        local PlayerData = ESX.GetPlayerData()
        return PlayerData.job.grade
    elseif SDC.Framework == "qbx-core" then
        local PlayerData = exports.qbx_core:GetPlayerData()
        return PlayerData.job.grade.level
    elseif SDC.Framework == "nd-core" then
        local PlayerData = exports["ND_Core"]:getPlayer()
        return PlayerData.jobInfo.rank
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("GetCurrentJobGrade", GetCurrentJobGrade)


--------------------------------------------------------------------------------------------------------------
-- Progress Bar Functions
--------------------------------------------------------------------------------------------------------------
function ProgressBar(time, label)
    if SDC.ProgressBar == "progressBars" then
        exports['progressBars']:startUI(time, label)
        Wait(time)
        return true
    elseif SDC.ProgressBar == "mythic_progbar" then
        TriggerEvent("mythic_progbar:client:progress", {
            name = "sdc_foodtrucks",
            duration = time,
            label = label,
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }
        })
        Wait(time)
        return true
    elseif SDC.ProgressBar == "ox_lib" then
        if lib.progressBar({
            duration = time,
            label =  label,
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
        }) then 
            return true
        end
    else
        Wait(time)
        return true
    end
end
exports("ProgressBar", ProgressBar)

--------------------------------------------------------------------------------------------------------------
-- Notification Functions
--------------------------------------------------------------------------------------------------------------
function ShowNotification(msg, extra)
	if SDC.NotificationSystem == 'tnotify' then
		exports['t-notify']:Alert({
			style = 'message', 
			message = msg
		})
	elseif SDC.NotificationSystem == 'mythic_old' then
		exports['mythic_notify']:DoHudText('inform', msg)
	elseif SDC.NotificationSystem == 'mythic_new' then
		exports['mythic_notify']:SendAlert('inform', msg)
	elseif SDC.NotificationSystem == 'okoknotify' then
		exports['okokNotify']:Alert("SDC Resources", msg, 3000, 'neutral')
    elseif SDC.NotificationSystem == 'ox_lib' then
        if extra == "primary" then
            lib.notify({
                title = "SDC Resources",
                description = msg,
                type = "inform"
            })
        else
            lib.notify({
                title = "SDC Resources",
                description = msg,
                type = extra
            })
        end
	elseif SDC.NotificationSystem == 'print' then
		print(msg)
	elseif SDC.NotificationSystem == 'framework' then
        if SDC.Framework == "qb-core" then
            QBCore.Functions.Notify(msg, extra)
        elseif SDC.Framework == "esx" then
            ESX.ShowNotification(msg)
        elseif SDC.Framework == "qbx-core" then
            exports.qbx_core:Notify(msg, extra)
        elseif SDC.Framework == "nd-core" then
            lib.notify({
                title = "SDC Resources",
                description = msg,
                type = "inform"
            })
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework

        end
	end 
end
exports("ShowNotification", ShowNotification)

--------------------------------------------------------------------------------------------------------------
-- Inventory Functions
--------------------------------------------------------------------------------------------------------------
function GetCurrentWeaponItem()
    if SDC.Inventory == "framework" then
        if SDC.Framework == "qbx-core" then
            return exports.ox_inventory:getCurrentWeapon()
        elseif SDC.Framework == "nd-core" then
            return exports.ox_inventory:getCurrentWeapon()
        elseif SDC.Framework == "custom" then
            --Here is where you would put your custom code for your custom framework
        end
    elseif SDC.Inventory == "ox_inventory" then
        return exports.ox_inventory:getCurrentWeapon()
    end
end
exports("GetCurrentWeaponItem", GetCurrentWeaponItem)

--------------------------------------------------------------------------------------------------------------
-- Vehicle Functions
--------------------------------------------------------------------------------------------------------------
function GiveVehicleFuel(veh)
    if SDC.FuelResource == "none" then
        --Leave Blank
    elseif SDC.FuelResource == "MSK_Fuel" then
        exports["msk_fuel"]:SetVehicleFuel(veh, 100.0)
    else
        exports[SDC.FuelResource]:SetFuel(veh, 100.0)
    end
end
exports("GiveVehicleFuel", GiveVehicleFuel)

function GiveKeysToVehicle(veh)
    if SDC.VehicleKeys == "framework" then
        if SDC.Framework == "qb-core" then
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        elseif SDC.Framework == "qbx-core" then
            TriggerServerEvent("SDC_CORE:Server:GiveVehKeys", NetworkGetNetworkIdFromEntity(veh))
        elseif SDC.Framework == "nd-core" then
            TriggerServerEvent("SDC_CORE:Server:GiveVehKeys", NetworkGetNetworkIdFromEntity(veh))
        end
    elseif SDC.VehicleKeys == "wasabi" then
        if SDC.Framework == "esx" then
            exports.wasabi_carlock:GiveKey(TrimVehiclePlate(GetVehicleNumberPlateText(veh)))
        elseif SDC.Framework == "qb-core" then
            exports.wasabi_carlock:GiveKey(QBCore.Functions.GetPlate(veh))
        else
            exports.wasabi_carlock:GiveKey(GetVehicleNumberPlateText(veh))
        end
    elseif SDC.VehicleKeys == "qs-vehiclekeys" then
        if SDC.Framework == "esx" then
            exports['qs-vehiclekeys']:GiveKeys(TrimVehiclePlate(GetVehicleNumberPlateText(veh)), GetEntityModel(veh), true)
        elseif SDC.Framework == "qb-core" then
            exports['qs-vehiclekeys']:GiveKeys(QBCore.Functions.GetPlate(veh), GetEntityModel(veh), true)
        else
            exports['qs-vehiclekeys']:GiveKeys(GetVehicleNumberPlateText(veh), GetEntityModel(veh), true)
        end
    elseif SDC.VehicleKeys == "mrnewb-vehiclekeys" then
        if SDC.Framework == "esx" then
            exports.MrNewbVehicleKeys:GiveKeys(veh)
        elseif SDC.Framework == "qb-core" then
            exports.MrNewbVehicleKeys:GiveKeys(veh)
        else
            exports.MrNewbVehicleKeys:GiveKeys(veh)
        end
    elseif SDC.VehicleKeys == "custom" then
        --Here is where you would put your custom code for your custom resource

    end
end
exports("GiveKeysToVehicle", GiveKeysToVehicle)

function RemoveKeysFromVehicle(veh)
    --HERE IS WHERE YOU WOULD PUT YOUR CODE FOR REMOVING KEYS

    
end
exports("RemoveKeysFromVehicle", RemoveKeysFromVehicle)

function TrimVehiclePlate(plate)
    if SDC.Framework == "esx" then
        return ESX.Math.Trim(plate)
    else
        return plate
    end
end
exports("TrimVehiclePlate", TrimVehiclePlate)

function SetVehicleProperties(veh, props)
    if SDC.Framework == "qb-core" then
        QBCore.Functions.SetVehicleProperties(veh, props)
    elseif SDC.Framework == "esx" then
        ESX.Game.SetVehicleProperties(veh, props)
    elseif SDC.Framework == "qbx-core" then
        lib.setVehicleProperties(veh, props)
    elseif SDC.Framework == "nd-core" then
        lib.setVehicleProperties(veh, props)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework

    end
end
exports("SetVehicleProperties", SetVehicleProperties)

function GetVehicleProperties(veh)
    if SDC.Framework == "qb-core" then
        return QBCore.Functions.GetVehicleProperties(veh)
    elseif SDC.Framework == "esx" then
        return ESX.Game.GetVehicleProperties(veh)
    elseif SDC.Framework == "qbx-core" then
        return lib.getVehicleProperties(veh)
    elseif SDC.Framework == "nd-core" then
        return lib.getVehicleProperties(veh)
    elseif SDC.Framework == "custom" then
        --Here is where you would put your custom code for your custom framework
        
    end
end
exports("GetVehicleProperties", GetVehicleProperties)