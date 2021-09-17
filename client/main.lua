ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_item:luotiliivi')
AddEventHandler('esx_item:luotiliivi', function()
    TriggerEvent("disabledWeapons", true)
    TriggerEvent("destroyPropPerm")
    exports['progressBars']:startUI(15000, "Puetaan luotiliivejä")
    local playerPed = PlayerPedId(-1)
    RequestAnimDict("move_m@hiking")
    RequestAnimDict("amb@world_human_hiker_standing@male@idle_a")

    TaskPlayAnim(GetPlayerPed(PlayerId()), "move_m@hiking", "idle_intro", 1.0, -1, -1, 50, 0, 0, 0, 0)
    Citizen.Wait(5000)
    
    TaskPlayAnim(GetPlayerPed(PlayerId()), "move_m@hiking", "idle_intro", 1.0, -1, -1, 50, 0, 0, 0, 0)
	Citizen.Wait(5000)

    TaskPlayAnim(GetPlayerPed(PlayerId()), "amb@world_human_hiker_standing@male@idle_a", "idle_b", 1.0, -1, -1, 50, 0, 0, 0, 0)
	Citizen.Wait(5000)

    StopAnimTask(PlayerPedId(), 'amb@world_human_hiker_standing@male@idle_a', 'idle_b', 1.0)
    StopAnimTask(PlayerPedId(), 'move_m@hiking', 'idle_intro', 1.0)
    
    AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
	ClearPedTasks(GetPlayerPed(-1))
	SetPedComponentVariation(GetPlayerPed(-1), 9, 27, 9, 0)
end)