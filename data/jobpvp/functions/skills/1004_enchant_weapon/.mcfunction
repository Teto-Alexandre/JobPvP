#> jobpvp:skills/xxxx_template_active/
#
# スキルを発動したときのファンクション
#
# フォルダ名は
# xxxx_スキル名
# 

# 効果発動
    execute if data entity @s Inventory[{Slot:-106b}].tag.Enchantments run data modify storage jobpvp:item_modifier data.Enchantments set from entity @s Inventory[{Slot:-106b}].tag.Enchantments
    execute unless data entity @s Inventory[{Slot:-106b}].tag.Enchantments run data modify storage jobpvp:item_modifier data.Enchantments set value []
    data modify storage jobpvp:item_modifier data.Enchantments append from entity @s Inventory[{Slot:9b}].tag.StoredEnchantments[]
    item modify entity @s weapon.offhand jobpvp:apply_enchantment
    playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1 0
    particle minecraft:enchant ~ ~1 ~ 0.1 0.1 0.1 1 12 normal
    item replace entity @s inventory.9 with book

# MP減算
    execute store result score $temp Temporary run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:-1}].MP
    scoreboard players operation @s MP -= $temp Temporary
    scoreboard players reset $temp Temporary

# CT適応
    execute store result score $nowgametime Temporary run time query gametime
    execute store result score $CT Temporary run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:-1}].CT
    scoreboard players operation $CT Temporary += $nowgametime Temporary
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Skills[{Id:-1}].CTGametime int 1 run scoreboard players get $CT Temporary
    scoreboard players reset $nowgametime Temporary
    scoreboard players reset $CT Temporary