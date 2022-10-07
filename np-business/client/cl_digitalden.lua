local isSignedOn = false

local SignOn = {
    data = {
      {
        id = 'dd_sign_on',
        label = _L('interact-sign-in', 'sign in'),
        icon = 'lock',
        event = 'np-business:dd:jobState',
        parameters = { signIn = true },
      },
    },
    options = {
      npcIds = { 'digital_den_npc' },
      distance = { radius = 2.5 },
      isEnabled = function(pEntity, pContext)
        return IsEmployedAt("digital_den") and not isSignedOn
      end,
    },
}

local SignOff = {
    data = {
      {
        id = 'dd_sign_off',
        label = _L('interact-sign-out', 'sign out'),
        icon = 'lock-open',
        event = 'np-business:dd:jobState',
        parameters = { signIn = false },
      },
    },
    options = {
      npcIds = { 'digital_den_npc' },
      distance = { radius = 2.5 },
      isEnabled = function(pEntity, pContext)
        return IsEmployedAt("digital_den") and isSignedOn
      end,
    },
}

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("np-business:digitalDenArea", vector3(1132.47, -471.99, 66.43), 15.0, 17.2, {
        heading=346,
        minZ=64.63,
        maxZ=75.23
    })

    exports['np-interact']:AddPeekEntryByFlag({ 'isNPC' }, SignOn.data, SignOn.options)
    exports['np-interact']:AddPeekEntryByFlag({ 'isNPC' }, SignOff.data, SignOff.options)
end)

AddEventHandler("np-npcs:ped:openDigitalDenShop", function()
    local canOpen = RPC.execute("np-business:digitalDen:canUseNPC")

    if canOpen then
        TriggerEvent("server-inventory-open", "42073", "Shop")
    else
        TriggerEvent("DoLongHudText", _L("dd-speak-to-employee", "Please speak to one of our other employees."))
    end
end)

AddEventHandler("np-business:dd:jobState", function(pParams, pEntity, pContext)
    isSignedOn = RPC.execute("np-business:digitalDen:toggleJob", pParams.signIn)
end)
