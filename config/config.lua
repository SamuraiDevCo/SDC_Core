SDC = {}

---------------------------------------------------------------------------------
-------------------------------Important Configs---------------------------------
---------------------------------------------------------------------------------
SDC.Framework = "qb-core" --[[ SET UP YOUR FRAMEWORK HERE

    Can Be Anyone Of The Following Options Below:

    "qb-core" --Base QB-Core Functions will be utilized
    "esx" --Base ESX Legacy Functions will be utilized
    "qbx-core" --Base QBX Functions will be utilized
    "custom" --This is where you would input all your own functions for your resource!

]]

SDC.Inventory = "framework" --[[ SET UP YOUR INVENTORY HERE

    Can Be Anyone Of The Following Options Below:

    "framework" --This will utilize the base inventory functions for the framework selected above
    "ox_inventory" --This will utilize ox_inventory functions
    "quasar-inventory" --This will utilize quasar-inventory functions

]]

SDC.NotificationSystem = "framework" --[[ SET UP YOUR NOTIFICATIONS HERE

    Can Be Anyone Of The Following Options Below:

    "framework" --This will utilize the base notifcation functions for the framework selected above
    "mythic_old" --This will utilize the old mythic notify functions
    "mythic_new" --This will utilize the new mythic notify functions
    "tnotify" --This will utilize t-notify functions
    "okoknotify" --This will utilize okok-notify functions
    "ox_lib" --This will utilize ox_lib functions
    "print" --This will print all messages into f8 console
    "none" --This will not show any notifcations at all

]]


SDC.ProgressBar = "ox_lib" --[[ SET UP YOUR PROGRESS BAR HERE

    Can Be Anyone Of The Following Options Below:

    "progressBars" --This will use the progressBars functions
    "mythic_progbar" --This will use the mythic_progbar functions
    "ox_lib" --This will use the ox_lib functions
    "none" --This will disable the progress bar for all resources

]]

SDC.GarageResource = "framework" --[[ SET UP YOUR GARAGE RESOURCE HERE

    Can Be Anyone Of The Following Options Below:

    "framework" --This will use the base framework garage resource setup
    "qs-advancedgarages" --This will use the quasar advanced garages setup

]]
SDC.DefaultGarage = "legionsquare" --[[ Choose Your Default Garage Here

    Can be any of the garage names set inside your garage resource

]]

SDC.VehicleKeys = "framework" --[[ SET UP YOUR VEHICLE KEYS RESOURCE HERE

    Can Be Anyone Of The Following Options Below:

    "framework" --This will use the base framework vehicle keys resource setup
    "wasabi" -- This will use the wasabi vehicle keys setup
    "custom" -- This is where you would input all your own functions for your resource!

]]


SDC.FuelResource = "none" --[[ SET UP YOUR FUEL RESOURCE HERE

    Can Be Anyone Of The Following Options Below: (If you have others it should be fine to just put the resource name)

    "none" --This will disable the fuel functions for all resources
    "LegacyFuel" --This will utilize functions from LegacyFuel

]]


SDC.RandomPlateSettings = { --SET UP YOUR PLATE SETTINGS HERE
    UseCustomPlateSetup = false, --If you want to use a custom plate setup (If FALSE it will use default setup for framework)

    CustomPlateSetup = {
        TotalPlateLength = 8, --How many letters/numbers are in the plate
        PutBreakInMiddle = false --If you want it to put a break after the 3rd character on the plate
    }
}