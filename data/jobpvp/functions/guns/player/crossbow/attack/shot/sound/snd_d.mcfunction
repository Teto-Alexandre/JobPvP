# デッドロック
    execute if score $sound ui_temp matches -1 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/1
# 連射系 - IRONGOLEM_HIT-1-2-0,SKELETON_HURT-1-2-0,ZOMBIE_WOOD-1-2-0
    execute if score $sound ui_temp matches -2 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/2
# LMG - IRONGOLEM_HIT-1-2-0,SKELETON_HURT-1-2-0,ZOMBIE_WOOD-1-2-0,ITEM_BREAK-1-2-2,NOTE_SNARE_DRUM-1-0-2,BLAZE_HIT-1-2-0,DOOR_CLOSE-1-2-4
    execute if score $sound ui_temp matches -3 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/3
# PDW - SHOOT_ARROW-1-2-0,NOTE_SNARE_DRUM-1-0-2,SKELETON_HURT-1-2-0,ZOMBIE_WOOD-1-2-0
    execute if score $sound ui_temp matches -4 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/4
# SG - WITHER_SHOOT-1-2-0,EXPLODE-1-2-0
    execute if score $sound ui_temp matches -5 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/5
# HG - BLAZE_HIT-1-2-0,ZOMBIE_WOOD-1-2-0,DOOR_CLOSE-1-2-4
    execute if score $sound ui_temp matches -6 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/6
# SR - IRONGOLEM_HIT-1-2-0,SKELETON_HURT-1-2-0,ZOMBIE_WOOD-1-2-0,FIRE_IGNITE-1-1-4,DOOR_OPEN-1-2-6
    execute if score $sound ui_temp matches -7 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/7
# DustShot
    execute if score $sound ui_temp matches -8 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/8
# Rocket - ghast_fireball-1-2-0,SHOOT_ARROW-1-2-0,MAGMACUBE_WALK-1-2-0
    execute if score $sound ui_temp matches -9 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/9
# walther
    execute if score $sound ui_temp matches -10 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/10
# Echo
    execute if score $sound ui_temp matches -11 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/11
# Flame
    execute if score $sound ui_temp matches -12 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/12
# Lightning
    execute if score $sound ui_temp matches -13 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/13
# DiceCurse
    execute if score $sound ui_temp matches -14 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/14
# bow
    execute if score $sound ui_temp matches -15 run function jobpvp:guns/player/crossbow/attack/shot/sound/downer/15
# WindCutter
    execute if score $sound ui_temp matches -16 run playsound entity.evoker.cast_spell player @a ~ ~ ~ 1 1 0
