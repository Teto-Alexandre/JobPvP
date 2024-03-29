# リロード

# 現在の装弾数を確認
    execute if score $hand ui_temp matches 0 run data modify storage ui:tmw temp.this set from entity @s SelectedItem
    execute if score $hand ui_temp matches 1 run data modify storage ui:tmw temp.this set from entity @s Inventory[{Slot:-106b}]
    data modify storage ui:gun temp set from storage ui:tmw temp.this.tag.tmw.gun
    data modify storage ui:temp temp set from storage ui:tmw temp.this.tag.tmw.bullets
    execute store result score $num ui_temp run data get storage ui:temp temp
    scoreboard players set $check ui_temp 0
    function jobpvp:guns/player/crossbow/reload/linear_count
    execute store result score $magazine ui_temp run data get storage ui:gun temp.Magazine
    scoreboard players operation $magazine.max ui_temp = $magazine ui_temp
    scoreboard players operation $magazine ui_temp -= $check ui_temp

# 装弾数が最大装弾数より少ないなら弾を消費
    scoreboard players set $add ui_temp 0
    execute if score $magazine ui_temp matches ..0 at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 0.8 0
    execute if score $magazine ui_temp matches 1.. run function jobpvp:guns/player/crossbow/reload/def_type/manager

# データクリア
    data remove storage ui:temp temp
    data remove storage ui:temp temp2

#
    execute if score $add ui_temp matches 1 run function jobpvp:guns/player/crossbow/reload/def_type/mag_sum