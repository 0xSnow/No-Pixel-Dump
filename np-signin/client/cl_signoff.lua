function signOff()
  TriggerServerEvent("TokoVoip:removePlayerFromAllRadio", GetPlayerServerId(PlayerId()))
  exports["np-voice"]:SetRadioPowerState(false)
  TriggerServerEvent("jobssystem:jobs", "unemployed")
  TriggerServerEvent('myskin_customization:wearSkin')
  TriggerServerEvent('tattoos:retrieve')
  TriggerServerEvent('Blemishes:retrieve')
  TriggerEvent("police:noLongerCop")
  TriggerEvent("logoffmedic")
  TriggerEvent("loggedoff")
  TriggerEvent('nowCopDeathOff')
  TriggerEvent('nowCopSpawnOff')
  TriggerEvent('nowMedicOff')
  TriggerEvent('np-signin:signoff')
  TriggerServerEvent("TokoVoip:clientHasSelecterCharacter")
  SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
  SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
  SetPoliceIgnorePlayer(PlayerPedId(),false)
  TriggerEvent("isJudgeOff")
  TriggerEvent("DoLongHudText", 'Signed off Duty!', 1)
end
