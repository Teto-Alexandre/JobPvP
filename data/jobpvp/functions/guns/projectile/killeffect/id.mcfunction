# ヒットパーティクル

# サイズ別通常爆発
    execute if score @s ui_hpart matches 3..10 run function jobpvp:guns/projectile/killeffect/upper/generic_explosion/master

#
    execute if score @s ui_hpart matches 101.. run function jobpvp:guns/projectile/killeffect/kef_u
    execute if score @s ui_hpart matches ..-1 run function jobpvp:guns/projectile/killeffect/kef_d
