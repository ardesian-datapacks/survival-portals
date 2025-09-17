# zPortal

execute at @s run tag @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] add TeleportingEntity
tag @s remove PrimedPortal
tag @s add TeleportSource

# Summon teleporting stand

# *poof* away
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
particle minecraft:flash ~ ~0.5 ~
particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"],NoGravity:1b,Invisible:1b,Marker:1b}
execute as @e[tag=TeleportLocation] run function ardesian:teleporter/teleport

# Cleanup
tag @e remove TeleportSource
tag @e remove TeleportingEntity
kill @e[tag=TeleportLocation]
