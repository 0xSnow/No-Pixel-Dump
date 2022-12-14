NPX = {}
NPX.Jobs = {}
NPX.Jobs.ValidJobs = {
    ["unemployed"] = {
        name = "Unemployed",
        paycheck = 14, -- * 8
        decor = 0,
        requiresDriversLicense = false
    },
    ["ems"] = {
        name = "EMS",
        paycheck = 140,
        garages = { "pillbox_ambulance", "ems_shared" },
        whitelisted = true,
        ranks = {
            [1] = "EMT",
            [2] = "Paramedic",
            [3] = "Lieutenant of EMS",
            [4] = "Assistant Chief",
            [5] = "Chief of EMS"
        },
        decor = 1,
        requiresDriversLicense = true
    },
    ["police"] = {
        name = "Police officer",
        paycheck = 130,
        whitelisted = true,
        ranks = {
            [1] = "Cadet",
            [2] = "Trooper",
            [3] = "Corporal",
            [4] = "Sergeant",
            [5] = "Staff Sergeant",
            [6] = "Inspector",
            [7] = "Lieutenant",
            [8] = "Captain",
            [9] = "Major",
            [10] = "Commander",
            [11] = "Lieutenant Colonel",
            [12] = "Assistant Chief",
            [13] = "Chief of Police"
        },
        garages = { "mrpd_garage", "pd_shared", "pd_shared_bike", "vbpd_garage", "paleto_garage" },
        decor = 2,
        requiresDriversLicense = true
    },
    ["foodtruck"] = {
        name = "Food Truck",
        paycheck = 0,
        decor = 4,
        requiresDriversLicense = true
    },
    ["taxi"] = {
        name = "Taxi driver",
        paycheck = 0,
        decor = 5,
        requiresDriversLicense = true
    },
    ["trucker"] = {
        name = "Delivery Job",
        paycheck = 0,
        decor = 6,
        requiresDriversLicense = true
    },
    ["entertainer"] = {
        name = "Entertainer",
        paycheck = 50,
        decor = 7,
        requiresDriversLicense = false
    },
    ["news"] = {
        name = "News Reporter",
        paycheck = 84,
        decor = 8,
        requiresDriversLicense = false
    },
    ["defender"] = {
        name = "Public Defender",
        paycheck = 110,
        decor = 9,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["district attorney"] = {
        name = "District Attorney",
        paycheck = 70,
        decor = 10,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["judge"] = {
        name = "Judge",
        paycheck = 150,
        decor = 11,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["broadcaster"] = {
        name = "Broadcaster",
        paycheck = 100,
        decor = 12,
        requiresDriversLicense = false
    },
    ["doctor"] = {
        name = "Doctor",
        paycheck = 147,
        garages = { "pillbox_ambulance", "ems_shared" },
        decor = 13,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["therapist"] = {
        name = "Therapist",
        paycheck = 145,
        decor = 14,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["driving instructor"] = {
        name = "Driving Instructor",
        paycheck = 130,
        garages = { "garage_drivingschool", "garage_drivingschool_back" },
        decor = 15,
        whitelisted = true,
        requiresDriversLicense = true
    },
    ["foodtruckvendor"] = {
        name = "Food Truck Vendor",
        paycheck = 0,
        decor = 16,
        requiresDriversLicense = false
    },
    ["doc"] = {
        name = "Department of Corrections officer",
        garages = { "mrpd_garage", "pd_shared", "pd_shared_bike" },
        paycheck = 120,
        decor = 17,
        whitelisted = true,
        requiresDriversLicense = true
    },
    ["mayor"] = {
        name = "Mayor",
        paycheck = 175,
        decor = 18,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["deputy_mayor"] = {
        name = "Deputy Mayor",
        paycheck = 138,
        decor = 19,
        whitelisted = true,
        requiresDriversLicense = false
    },
    ["county_clerk"] = {
        name = "County Clerk",
        paycheck = 99,
        decor = 20,
        whitelisted = true,
        requiresDriversLicense = false
    }
}
