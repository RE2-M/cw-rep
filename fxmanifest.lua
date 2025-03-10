fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

description 'cw-rep: a reputation and skill system'

version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'     
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
    'client/client.lua',
    'client/functions.lua',
    'client/gui.lua'
}
