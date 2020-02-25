name 'Prospecting'
author 'glitchdetector'
contact 'glitchdetector@gmail.com'

fx_version 'adamant'
game 'gta5'

description 'Prospect for treasure in key locations'
details [[
    Inspired by the Prospect minigame in MySims
    Metal detector model by Vartanyan
    https://www.turbosquid.com/3d-models/3d-metal-detector/1138741
    Converted by glitchdetector
    Yes, I did actually buy it for $11
]]

dependencies {'instructional-buttons'}
client_script '@instructional-buttons/include.lua'

dependencies {'multilingual'}
function language_file(fn) file(fn) language_json(fn) end
language_file 'lang.json'

client_script 'scripts/cl_*.lua'
server_script 'scripts/sv_*.lua'

file 'stream/gen_w_am_metaldetector.ytyp'

server_exports {
    'AddProspectingTarget', -- x, y, z, data
    'AddProspectingTargets', -- list
    'StartProspecting', -- player
    'StopProspecting', -- player
    'IsProspecting', -- player
    'SetDifficulty', -- modifier
}
