#> jobpvp:jobs/0001_attacker/set/status
#
# 職業の作成
# ここでステータスを設定する
#
# @within function jobpvp:jobs/0009_witch/set/

# 職業のIDを入れる(フォルダ名のxxxxの部分)
    data modify storage jobpvp: job_ID set value 9
# 職業の名前
    data modify storage jobpvp: job_name set value '{"text":"ウィッチ"}'
# 職業のフレーバーテキスト
    data modify storage jobpvp: job_desc set value ['{"text":"おくすりおいしい\\u0020\\u0020+3"}']

# 攻撃力の増減

# 防御力の増減
    #data modify storage jobpvp: armor set value 
    data modify storage jobpvp: armor set value -0.5
# 移動速度の増減
    #data modify storage jobpvp: movement_speed set value 
     data modify storage jobpvp: movement_speed set value 0.05
# 最大体力の増減
    #data modify storage jobpvp: max_health set value 
     data modify storage jobpvp: max_health set value 5
# ノックバック耐性の増減
    #data modify storage jobpvp: knockback_resistance set value 
    