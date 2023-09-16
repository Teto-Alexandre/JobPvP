#> jobpvp:jobs/0001_attacker/set/
#
# 職業を選択したときのファンクション
#
# フォルダ名は
# xxxx_職業名
# 


# 職業のデータを取ってくる
    function jobpvp:jobs/0009_witch/set/status

# 職業更新の処理
    execute as @p run function jobpvp:jobs/updata

# reset
    data remove storage jobpvp: job_ID
    data remove storage jobpvp: job_name
    data remove storage jobpvp: job_desc
    data remove storage jobpvp: attack_damage
    data remove storage jobpvp: armor
    data remove storage jobpvp: movement_speed
    data remove storage jobpvp: max_health
    data remove storage jobpvp: knockback_resistance
