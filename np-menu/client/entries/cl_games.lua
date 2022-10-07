local GeneralEntries, SubMenu = MenuEntries['games'], {}

local GameOptions = {
    {
        data = {
            id = 'games:leaveGame',
            title = _L('menu-games-leave', 'Leave'),
            icon = '#arcade-game-leave',
            event = 'np-games:leaveLobby',
            parameters = {}
        },
        isEnabled = function ()
            return exports['np-games']:isInStartedLobby()
        end
    },
    {
        data = {
            id = 'games:restartGame',
            title = _L('menu-games-restart', 'Restart'),
            icon = '#arcade-game-restart',
            event = 'np-games:restartGame',
            parameters = {}
        },
        isEnabled = function ()
            local inLobby = exports['np-games']:isInStartedLobby()
            local isLeader = exports['np-games']:isLobbyLeader()
            local canBeRestarted = exports['np-games']:canBeRestarted()
            return inLobby and isLeader and canBeRestarted
        end
    },
    {
        data = {
            id = 'games:endGame',
            title = _L('menu-games-end', 'End Game'),
            icon = '#arcade-game-end',
            event = 'np-games:endGame',
            parameters = {}
        },
        isEnabled = function ()
            local inLobby = exports['np-games']:isInStartedLobby()
            local isLeader = exports['np-games']:isLobbyLeader()
            return inLobby and isLeader
        end
    },
    {
        data = {
            id = 'games:tdm:changeLoadout',
            title = _L('menu-games-airsoft-tdm-changeloadout', 'Change Loadout'),
            icon = '#arcade-airsoft-tdm-changeloadout',
            event = 'np-games:airsoft:tdm:showLoadoutMenu',
            parameters = {}
        },
        isEnabled = function ()
            local inLobby = exports['np-games']:isInStartedLobby()
            local isInTDM = exports['np-games-airsoft']:isInTDM()
            local isSpawned = exports['np-games-airsoft']:isSpawnedTDM()
            return inLobby and isInTDM and isSpawned
        end
    },
}

Citizen.CreateThread(function()
    for index, data in ipairs(GameOptions) do
        SubMenu[index] = data.data.id
        MenuItems[data.data.id] = data
    end
    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = 'arcade:gameOptions',
            title = _L('menu-arcade-games-options', 'Arcade'),
            icon = '#arcade-game-options',
        },
        subMenus = SubMenu,
        isEnabled = function()
            local hasGame = exports['np-games']:isInStartedLobby()
            return not isDead and hasGame
        end,
    }
end)
