# 必要データ収集
    # UUID 収集
    data modify storage ui:gun temp2.UUID set from entity @s UUID
    #
    execute if entity @s[nbt={OnGround:1b}] store result score $spread ui_temp run data get storage ui:gun temp2.Spread
    execute if entity @s[nbt={OnGround:0b}] store result score $spread ui_temp run data get storage ui:gun temp2.AirSpread
    execute store result score $barrel ui_temp run data get storage ui:gun temp2.Barrel
    execute store result score $multishot ui_temp run data get storage ui:gun temp2.MultiShot

#
    function jobpvp:guns/player/crossbow/attack/shot/each

# 収束解除
    scoreboard players set @s ui_st2 0

# 成功
    tag @s add ui_temp_success

# 射撃後
    ## 消滅
    execute if data storage ui:gun temp.OneTimeUse run function jobpvp:guns/player/crossbow/attack/one_time_use

# 変更した
    scoreboard players set $changed ui_temp 1
    ## 装弾数確認
    execute if score $hand ui_temp matches 0 run data modify storage ui:temp temp set from entity @s SelectedItem.tag.tmw.bullets
    execute if score $hand ui_temp matches 1 run data modify storage ui:temp temp set from entity @s Inventory[{Slot:-106b}].tag.tmw.bullets
    execute store result score $num ui_temp run data get storage ui:temp temp
    scoreboard players set $check ui_temp 0
    function jobpvp:guns/player/crossbow/reload/linear_count
    scoreboard players operation $bullets ui_temp = $check ui_temp
