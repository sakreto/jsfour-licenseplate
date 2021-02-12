local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- UPDATE license plate to the database
ESX.RegisterServerCallback('jsfour-licenseplate:update', function(source, cb, oldP, newP)
  local xPlayer  = ESX.GetPlayerFromId(source)
  local count = xPlayer.getInventoryItem('licenseplate').count

        if count > 0 then
          xPlayer.removeInventoryItem('licenseplate', 1)
          cb('found')
        end

        else

          DropPlayer(source,'Desordenes') --deberias banearlo
          cb('error')

        end
end)

-- Usable license plate
ESX.RegisterUsableItem('licenseplate', function(source)
	TriggerClientEvent('jsfour-licenseplate', source)
end)
