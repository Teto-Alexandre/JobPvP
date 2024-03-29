#> jobpvp:player/death
#
# プレイヤーが死んだときの処理
#
# @within function jobpvp:gameing/tick


# 残機を減らす
    execute if score $Gameing Global matches 1 run scoreboard players remove @s Life 1

# 残機0ならスペクテイター
    execute if score @s Life matches 0 run gamemode spectator @s
    execute if score @s Life matches 0 run tag @s remove pvp_player
    execute if score @s Life matches 0 run scoreboard players reset @s Life

# 残り人数の確認
    execute store result score $player_count Global if entity @a[tag=pvp_player] 

    #個人戦
        execute if score $team Global matches 0 if score $player_count Global matches 1 run function jobpvp:gameing/won

    #チーム戦
        execute unless score $team Global matches 0 store result score $player_count_team Global if entity @a[tag=pvp_player,team=red]
        execute unless score $team Global matches 0 if score $player_count Global = $player_count_team Global run data modify storage jobpvp: won set value "red"

        execute unless score $team Global matches 0 store result score $player_count_team Global if entity @a[tag=pvp_player,team=blue]
        execute unless score $team Global matches 0 if score $player_count Global = $player_count_team Global run data modify storage jobpvp: won set value "blue"

        execute unless score $team Global matches 0 store result score $player_count_team Global if entity @a[tag=pvp_player,team=green]
        execute unless score $team Global matches 0 if score $player_count Global = $player_count_team Global run data modify storage jobpvp: won set value "green"

        execute unless score $team Global matches 0 store result score $player_count_team Global if entity @a[tag=pvp_player,team=yellow]
        execute unless score $team Global matches 0 if score $player_count Global = $player_count_team Global run data modify storage jobpvp: won set value "yellow"

        execute unless score $team Global matches 0 if data storage jobpvp: won run function jobpvp:gameing/won

# reset
    scoreboard players reset $player_count Global
    scoreboard players reset $player_count_team Global
    data remove storage jobpvp: won
    scoreboard players reset @s deathCount
