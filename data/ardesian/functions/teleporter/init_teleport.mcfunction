# zPortal

execute at @s run tag @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] add TeleportingEntity
tag @s remove PrimedPortal
tag @s add TeleportSource

# Summon teleporting stand
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"],NoGravity:1b,Invisible:1b,Marker:1b}
execute as @e[tag=TeleportLocation] run function ardesian:teleporter/teleport

# Cleanup
tag @e remove TeleportSource
tag @e remove TeleportingEntity
kill @e[tag=TeleportLocation]
