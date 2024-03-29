# Multiごとに個別

#
    #tellraw @a [{"text":"Hand/ReloadItem/fire:","color":"red"},{"score":{"name":"$hand","objective":"ui_temp"},"color":"red"},{"text":"/","color":"red"},{"score":{"name":"$reloaditem","objective":"ui_temp"},"color":"red"},{"text":"/","color":"red"},{"score":{"name":"$fire","objective":"ui_temp"},"color":"red"},{"text":" no_shot/power:","color":"gold"},{"score":{"name":"$no_shot","objective":"ui_temp"},"color":"gold"},{"text":"/","color":"gold"},{"score":{"name":"$power","objective":"ui_temp"},"color":"gold"}]
    execute if score $hand ui_temp matches 0 run data modify storage ui:tmw temp.this set from entity @s SelectedItem
    execute if score $hand ui_temp matches 1 run data modify storage ui:tmw temp.this set from entity @s Inventory[{Slot:-106b}]
    execute if score $reloaditem ui_temp matches 0 run data modify storage ui:gun temp3 set from storage ui:tmw temp.this.tag.tmw.bullets[0]
    execute if score $reloaditem ui_temp matches 1 if score $fire ui_temp matches 1 run data modify storage ui:gun temp3 set from storage ui:tmw temp.this.tag.tmw.bullet
    execute if score $reloaditem ui_temp matches 1 if score $fire ui_temp matches 2 run data modify storage ui:gun temp3 set from storage ui:tmw temp.this.tag.tmw.bullet2
    execute if score $reloaditem ui_temp matches 1 if score $fire ui_temp matches 3 run data modify storage ui:gun temp3 set from storage ui:tmw temp.this.tag.tmw.bullet3
    execute store result score $no_shot ui_temp run data get storage ui:gun temp3.NoShot
    execute store result score $mass ui_temp run data get storage ui:gun temp3.Mass
    execute store result score $power ui_temp run data get storage ui:gun temp3.Power
    scoreboard players set $speed.add ui_temp 0
    execute store result score $air_res ui_temp run data get storage ui:gun temp3.AirRes 100
    execute store result score $gravity ui_temp run data get storage ui:gun temp3.Gravity
    execute store result score $pack ui_temp run data get storage ui:gun temp3.Pack
    execute store result score $spread.min ui_temp run data get storage ui:gun temp3.Spread
    scoreboard players set $range ui_temp 2000
    execute if data storage ui:gun temp3.Range store result score $range ui_temp run data get storage ui:gun temp3.Range
    execute store result score $damage_type ui_temp run data get storage ui:gun temp3.DamageType
    execute store result score $particle.fly ui_temp run data get storage ui:gun temp3.FlyParticle
    execute store result score $particle.end ui_temp run data get storage ui:gun temp3.EndParticle
    execute store result score $weak_mult ui_temp run data get storage ui:gun temp3.WeakMultiplier
    execute store result score $back_mult ui_temp run data get storage ui:gun temp3.BackMultiplier
    execute store result score $muzzle ui_temp run data get storage ui:gun temp3.Muzzle
    execute store result score $sound ui_temp run data get storage ui:gun temp3.Sound

#
    data modify storage ui:object_maker temp.DisplayName set from storage ui:gun temp.DisplayName
    data modify storage ui:object_maker temp.UUID set from storage ui:gun temp2.UUID
    data modify storage ui:object_maker temp.FlyModifiers set from storage ui:gun temp3.FlyModifiers
    data modify storage ui:object_maker temp.HitModifiers set from storage ui:gun temp3.HitModifiers

# 計算
    # 弾速 = 弾体質量 x 火力 [基準：ハンドガンで100ぐらいを想定]
    scoreboard players operation $speed ui_temp = $power ui_temp
    scoreboard players operation $speed ui_temp /= $mass ui_temp
    execute if score $speed ui_temp > $barrel ui_temp run function jobpvp:guns/player/crossbow/attack/shot/over_barrel
    #tellraw @a [{"text":"Speed:","color":"red"},{"score":{"name":"$speed","objective":"ui_temp"},"color":"red"},{"text":"/","color":"red"},{"score":{"name":"$barrel","objective":"ui_temp"},"color":"red"}]
    # 弾速振幅最大値 = 弾速 x 0.2 ( 弾速 = 本来の弾速 x 1 ~ 1.2 )
    scoreboard players operation $speed.plus ui_temp = $speed ui_temp
    scoreboard players operation $speed.plus ui_temp /= #5 ui_num
    # 反動 = 火力 x 弾体数 [基準：ハンドガンで100,ショットガンで300ぐらい]
    scoreboard players operation $recoil ui_temp = $power ui_temp
    scoreboard players operation $recoil ui_temp *= $pack ui_temp
    # 新散布係数 = 散布係数 + 反動
    scoreboard players operation $spread ui_temp += $recoil ui_temp
    execute as @e[tag=tmw_255.snipe,distance=..0.1,limit=1] run function jobpvp:guns/player/crossbow/attack/shot/scope
    scoreboard players operation $sneak_time ui_temp < #60 ui_num
    scoreboard players operation $sneak_time ui_temp *= #100 ui_num
    scoreboard players operation $spread ui_temp -= $sneak_time ui_temp
    scoreboard players operation $spread ui_temp /= #20 ui_num
    scoreboard players operation $spread ui_temp > $spread.min ui_temp

#
    execute anchored eyes positioned ^-0.25 ^-0.1 ^ run function jobpvp:guns/player/crossbow/attack/shot/make_projectile

#
    data remove storage ui:gun temp3

# 書き込み開始
    data modify storage ui:temp temp set from storage ui:tmw temp.this.tag.tmw.bullets
    execute store result score $count ui_temp run data get storage ui:temp temp[0].Count
    scoreboard players remove $count ui_temp 1
    execute if score $count ui_temp matches ..0 run data remove storage ui:temp temp[0]
    execute if score $count ui_temp matches 1.. store result storage ui:temp temp[0].Count int 1 run scoreboard players get $count ui_temp

# 書き込み終了
    execute if score $hand ui_temp matches 0 run item modify entity @s weapon.mainhand ui:gun/value/bullets
    execute if score $hand ui_temp matches 1 run item modify entity @s weapon.offhand ui:gun/value/bullets

# 弾切れチェック
    execute store result score $check ui_temp run data get storage ui:temp temp
    execute if score $check ui_temp matches ..0 run scoreboard players set $item ui_temp 0
    execute if score $check ui_temp matches ..0 run function jobpvp:guns/player/switch/replace

# データクリア
    data remove storage ui:temp temp

# リピート
    scoreboard players remove $multishot ui_temp 1
    execute if score $check ui_temp matches 1.. if score $multishot ui_temp matches 1.. run function jobpvp:guns/player/crossbow/attack/shot/each