function retriveHousingTable()
	return Housing.info
end

function retrieveHousingTableMapped()
    local mapped = {}
    for id, housing in pairs(Housing.info) do
        if housing.enabled then
            local coords = housing[1]
            table.insert(mapped, {
                id = id,
                coords = {
                    x = housing[1].x,
                    y = housing[1].y,
                    z = housing[1].z
                },
                model = housing.model,
                street = housing.Street
            })
        end
    end
	return mapped
end

function retrieveHousingZonesConfig()
    return Housing.zoningPrices
end

function getHousingCatFromPropertID(propertyID)
    local targetPropertyType = Housing.typeInfo[Housing.info[propertyID].model].cat
    if Housing.info[propertyID].override then
        targetPropertyType = Housing.info[propertyID].override
    end

    return targetPropertyType
end


Housing.zone = {}
Housing.info = {}

-- Any new Static housing can go into here :) , it will get pushed to the DB and given an ID , do not give it an ID since it will be discarded here
-- duplicate street names will not be added
-- removing from this list will not remove them from the game
-- disable them on the DB if they need to be removed
Housing.newStatic = {
    --{vector4(60.41, -1579.4, 29.6, 214.56), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_36', ['Street'] = 'Testing Street', ["enabled"] = true},
    { vector4(-1027.67,-409.52,33.42, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'ghost_stash_houses_01', ['Street'] = 'Marathon Avenue 1', ['enabled'] = true },
    { vector4(-1033.98,-394.77,33.42, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'ghost_stash_houses_01', ['Street'] = 'Marathon Avenue 2', ['enabled'] = true },

    { vector4(-784.57,-885.65,24.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 1', ['enabled'] = true },
    { vector4(-775.35,-885.66,24.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 2', ['enabled'] = true },
    { vector4(-800.55,-885.68,24.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 3', ['enabled'] = true },
    { vector4(-798.4,-875.12,24.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 4', ['enabled'] = true },
    { vector4(-793.04,-865.6,24.94, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 5', ['enabled'] = true },
    { vector4(-787.46,-874.89,24.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 6', ['enabled'] = true },
    { vector4(-800.59,-885.75,29.41, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 7', ['enabled'] = true },
    { vector4(-784.85,-885.73,29.41, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 8', ['enabled'] = true },
    { vector4(-775.62,-885.6,29.41, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 9', ['enabled'] = true },
    { vector4(-798.62,-875.43,29.41, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 10', ['enabled'] = true },
    { vector4(-787.64,-875.27,29.43, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 11', ['enabled'] = true },
    { vector4(-792.97,-865.74,29.44, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 12', ['enabled'] = true },
    { vector4(-800.51,-885.58,33.93, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 13', ['enabled'] = true },
    { vector4(-798.35,-875.4,33.92, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 14', ['enabled'] = true },
    { vector4(-793.32,-865.92,33.96, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 15', ['enabled'] = true },
    { vector4(-787.49,-875.21,33.95, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 16', ['enabled'] = true },
    { vector4(-784.85,-885.81,33.93, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 17', ['enabled'] = true },
    { vector4(-775.43,-885.71,33.93, 0.0), vector4(0, 0, 0, 0.0),  ['model'] = 'v_int_44_empty', ['Street'] = 'Vescpucci Boulevard Apt 18', ['enabled'] = true },
}
