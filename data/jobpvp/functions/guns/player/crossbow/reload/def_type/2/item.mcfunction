# 弾が足りない

#
    scoreboard players set $success.section ui_temp 0

# 条件に当てはまる弾を線形探索で探し、スロットを特定する
    #execute if data storage ui:temp temp[{tag:{tmw:{id:255,type:2}}}] store result score $slot ui_temp run data get storage ui:temp temp[{tag:{tmw:{id:255,type:2}}}].Slot
    execute store result score $reloadenergy ui_temp run data get storage ui:gun temp.ReloadItem

#
    execute if score $reloadenergy ui_temp <= @s ui_tmw501_19_now_en run scoreboard players set $success.section ui_temp 1
    execute if score $success.section ui_temp matches 1 run scoreboard players operation @s ui_tmw501_19_now_en -= $reloadenergy ui_temp

# 弾を消費
    execute unless score $success.section ui_temp matches 0 run function jobpvp:guns/player/crossbow/reload/def_type/2/found