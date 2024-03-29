## アイテムに設定されたポーション効果を適応する

# データ隔離
function #oh_my_dat:please
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.tag.Itemdata.Potion run data modify storage jobpvp: lib_potion.Potion set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.tag.Itemdata.Potion
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.tag.Itemdata.Potion run data modify storage jobpvp: lib_potion.Item set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.id
execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.tag.Itemdata.Potion if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.OffhandItem.tag.Itemdata.Potion run data modify storage jobpvp: lib_potion.Potion set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.OffhandItem.tag.Itemdata.Potion
execute unless data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.SelectedItem.tag.Itemdata.Potion if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.OffhandItem.tag.Itemdata.Potion run data modify storage jobpvp: lib_potion.Item set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].PastData.OffhandItem.id

# カウント
execute store result score $num Temporary run data get storage jobpvp: lib_potion.Potion.Effects

# 切削
execute if score $num Temporary matches 1.. run function jobpvp:lib/apply_potion/1.burn

# 召喚
summon area_effect_cloud ~ ~ ~ {Tags:["Potion_AEC","temp_unpower"],Particle:"",NoGravity:1b,Radius:0.0f,Age:4,Duration:6,WaitTime:0,Effects:[]}
data modify entity @e[tag=Potion_AEC,tag=temp_unpower,limit=1,sort=nearest] Effects set from storage jobpvp: lib_potion.Output.Effects[]
tag @e[tag=temp_unpower] remove temp_unpower

# 最後に
data remove storage jobpvp: lib_potion
scoreboard players reset $num Temporary
scoreboard players reset $potionId Temporary
scoreboard players reset $success Temporary