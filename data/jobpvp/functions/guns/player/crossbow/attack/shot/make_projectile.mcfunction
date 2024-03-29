# オブジェクトを作成

#declare score_holder $particlefly
#declare score_holder $particleend
#declare score_holder $speed
#declare score_holder $mass
#declare score_holder $air_res
#declare score_holder $gravity
#declare score_holder $damage_type
#declare score_holder $weak_mult
#declare score_holder $back_mult
#declare score_holder $id
#declare score_holder $team
#declare score_holder $spread
#declare score_holder $pack
#declare score_holder $muzzle
#declare score_holder $sound
#declare score_holder $no_shot
#declare storage ui:object_maker

#ui:object_maker temp.DisplayName
#ui:object_maker temp.UUID
#ui:object_maker temp.FlyModifiers
#ui:object_maker temp.HitModifiers

# タイプごとに拡散して発射
    execute if score $no_shot ui_temp matches 0 run function jobpvp:guns/player/crossbow/attack/shot/spreadmanager/1

# マズルフラッシュ
    execute if score $muzzle ui_temp matches ..-1 run function jobpvp:guns/player/crossbow/attack/shot/muzzle/muz_d
    execute if score $muzzle ui_temp matches 1.. run function jobpvp:guns/player/crossbow/attack/shot/muzzle/muz_u

# 発射音
    execute if score $sound ui_temp matches ..-1 run function jobpvp:guns/player/crossbow/attack/shot/sound/snd_d
    execute if score $sound ui_temp matches 1.. run function jobpvp:guns/player/crossbow/attack/shot/sound/snd_u

#
    schedule function jobpvp:guns/player/crossbow/ss/1 1t append

#
    data remove storage ui:object_maker temp
