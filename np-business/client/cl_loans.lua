RegisterUICallback("np-ui:getLoans", function(data, cb)
    if data.type == "business" then
        local success, message = RPC.execute("GetLoansByBusinessId", data.id, data.params)
        cb({ data = message, meta = { ok = success, message = message } })
    elseif data.type == "state" then
        local success, message = RPC.execute("GetLoansByState")
        cb({ data = message, meta = { ok = success, message = message } })
    else
        local success, message = RPC.execute("GetLoansByCharacterId", data.id)
        cb({ data = message, meta = { ok = success, message = message } })
    end
end)

RegisterUICallback("np-ui:loanOffer", function(data, cb)
    RPC.execute("LoanOffer", data)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
end)

RegisterUICallback("np-ui:loanAccept", function(data, cb)
    local success, message = RPC.execute("LoanAccept", data)
    cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:loanDefault", function(data, cb)
  local success, message = RPC.execute("LoanDefault", data)
  cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:loanSeize", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })

    exports["np-ui"]:closeApplication("phone")

    exports['np-ui']:showContextMenu({
        { 
            title = "Seize Vehicle", 
            description = "List of vehicle available for seizure",
            action = "np-ui:repoSeizeVehicle",
            key = { id = data.loan.id, characterId = data.loan.character_id }
        },
        { 
            title = "Seize Property", 
            description = "List of properties available for seizure", 
            action = "np-ui:repoSeizeProperty",
            disabled = true,
            key = { id = data.loan.id, characterId = data.loan.character_id }
        },
    })
end)

RegisterUICallback("np-ui:loanPayment", function(data, cb)
    local success, message = RPC.execute("LoanPayment", data)
    cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:loanPaymentState", function(data, cb)
    local success, message = RPC.execute("LoanStatePayment", data)
    cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:fetchTotalPaymentsAmount", function(data, cb)
    local success, message = RPC.execute("LoanFetchStateAmount", data)
    cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:loanPaymentStateAll", function(data, cb)
    local success, message = RPC.execute("LoanStatePaymentAll", data)
    cb({ data = message, meta = { ok = success, message = message } })
end)

RegisterUICallback("np-ui:getLoanConfig", function(data, cb)
    local stateInterest, maxRate = RPC.execute("GetStateInterestRate")
    local data = {
        ["state_interest"] = stateInterest,
        ["max_interest_rate"] = maxRate,
    }
    cb({ data = data, meta = { ok = true, message = "done" } })
end)

RegisterNetEvent("loans:loanAcceptPrompt")
AddEventHandler("loans:loanAcceptPrompt", function(data)
  SendUIMessage({
    source = "np-nui",
    app = "phone",
    data = {
      action = "loan-offer",
      data = data,
    },
  })
end)