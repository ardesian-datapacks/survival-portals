# TeleportLocation

# *poof* away
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

# Move the armor stand to location
execute as @s run execute store result entity @s Pos[0] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosX
execute as @s run execute store result entity @s Pos[1] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosY
execute as @s run execute store result entity @s Pos[2] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosZ
execute as @s at @s run tp @s ~0.5 ~ ~0.5

# Tp to stand
tp @e[tag=TeleportingEntity] @s

# *poof* in
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
