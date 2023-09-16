#> jobpvp:skills/xxxx_template_active/
#
# スキルを発動したときのファンクション
#
# フォルダ名は
# xxxx_スキル名
# 

# 効果発動
    effect give @s resistance 5 9
    effect give @s strength 5 6
    playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 2 0
    playsound minecraft:entity.zombie.attack_iron_door player @s ~ ~ ~ 1 0.5
    particle dust 0.302 0.302 0.302 1 ~ ~1 ~ 0.4 0.4 0.4 1 10 normal
    particle dust 0.910 0.698 0.000 1 ~ ~1 ~ 0.4 0.4 0.4 1 15 normal

# MP減算
    execute store result score $temp Temporary run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:1023}].MP
    scoreboard players operation @s MP -= $temp Temporary
    scoreboard players reset $temp Temporary

# CT適応
    execute store result score $nowgametime Temporary run time query gametime
    execute store result score $CT Temporary run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:1023}].CT
    scoreboard players operation $CT Temporary += $nowgametime Temporary
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:1023}].CTGametime int 1 run scoreboard players get $CT Temporary
    scoreboard players reset $nowgametime Temporary
    scoreboard players reset $CT Temporary