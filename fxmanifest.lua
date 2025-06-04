fx_version 'cerulean'
games { 'gta5' }

author 'HoboDevCo'
description 'SDC | Core Resource'
version '1.0.9'

shared_script {
    "@ox_lib/init.lua",
    "config/config.lua"
}

client_scripts {
    "src/client/client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "src/server/server.lua",   
}

escrow_ignore {
    "config/config.lua",
    "src/client/client.lua",
    "src/server/server.lua"
}

lua54 'yes'
