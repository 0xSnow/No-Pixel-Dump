Citizen.CreateThread(function()
  exports["np-polytarget"]:AddBoxZone("cerb_indsutries_craft", vector3(221.0, -986.58, -99.0), 1.6, 1, {
    heading=0,
    minZ=-99.4,
    maxZ=-98.6,
  })

  exports["np-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft", {{
    id = 'ci_craft_wingsuits',
    label = 'Wingsuits',
    icon = 'circle',
    event = "np-cerb-industries:craftStuff",
    parameters =  { id = "420ci_wingsuits" },
  }}, { distance = { radius = 1.5 } })

  exports["np-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft", {{
    id = 'ci_craft_ramps',
    label = 'Ramps',
    icon = 'circle',
    event = "np-cerb-industries:craftStuff",
    parameters =  { id = "420ci_ramps" },
  }}, { distance = { radius = 1.5 } })

  exports["np-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft", {{
    id = 'ci_craft_misc',
    label = 'Misc',
    icon = 'circle',
    event = "np-cerb-industries:craftStuff",
    parameters =  { id = "420ci_misc", type = "Shop" },
  }}, { distance = { radius = 1.5 } })
end)

AddEventHandler("np-cerb-industries:craftStuff", function(p1, p2, p3)
  if not p1 then return end
  if not p1.id then return end
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "cerberus_industries"} })
  if not jobAccess then
    TriggerEvent("DoLongHudText", "You cannot use that", 2)
    return
  end
  TriggerEvent("server-inventory-open", p1.id, p1.type and p1.type or "Craft")
end)
