# 入力された方向に弾を出す
summon minecraft:armor_stand ~ ~ ~ {Marker:1b,NoGravity:1b,Invisible:1b,Tags:["tds.attack","ui","ui_proj","tmw_255","ui_temp_unpower"],ArmorItems:[{id:"minecraft:stone",Count:1b,tag:{display:{Name:'{"text":"null"}'}}},{},{},{}]}
#id共有
#team共有

#死亡メッセ変更
execute if score $deathmessage ui_temp matches 1 as @e[tag=ui_temp_unpower] run tag @s add tmw_255_deathmessage_14
#リフレク不可
execute if score $basetype ui_temp matches -2..-1 run tag @e[tag=ui_temp_unpower] add ui_refd
execute if score $basetype ui_temp matches -2..-1 run tag @e[tag=ui_temp_unpower] add tmw_255_noref

execute as @e[tag=ui_temp_unpower] run function jobpvp:guns/player/crossbow/attack/shot/temp_unpower