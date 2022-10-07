fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "np-lib"
} ]]--

ui_page 'client/html/index.html'

files {
  'client/html/*.html',
  'client/html/*.js',
  'client/html/*.css',
  'client/html/webfonts/*.eot',
  'client/html/webfonts/*.svg',
  'client/html/webfonts/*.ttf',
  'client/html/webfonts/*.woff',
  'client/html/webfonts/*.woff2',
  'client/html/css/*',
}

client_scripts {
  '@np-errorlog/client/cl_errorlog.lua',
  '@np-lib/client/cl_rpc.lua',
  '@np-lib/client/cl_ui.lua',
  'client/cl_tattooshop.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
}

shared_script {
  '@np-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_scripts {
  '@np-lib/server/sv_rpc.lua',
  '@np-lib/server/sv_rpc.js',
  '@np-lib/server/sv_sql.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}

export "CreateHashList"
export "GetTatCategs"
export "GetCustomSkins"
