# zPortal

execute at @s run tag @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] add TeleportingEntity
tag @s remove PrimedPortal
tag @s add TeleportSource

execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"],NoGravity:1b,Invisible:1b,Marker:1b}
execute as @e[type=minecraft:armor_stand,tag=TeleportLocation] run function ardesian:teleporter/teleport

# Cleanup. The traveller may have landed in another dimension, and this function
# itself may be running in any of the three, so clear the tag everywhere.
tag @e[type=minecraft:armor_stand,tag=TeleportSource] remove TeleportSource
execute in minecraft:overworld run tag @e[tag=TeleportingEntity] remove TeleportingEntity
execute in minecraft:the_nether run tag @e[tag=TeleportingEntity] remove TeleportingEntity
execute in minecraft:the_end run tag @e[tag=TeleportingEntity] remove TeleportingEntity
kill @e[type=minecraft:armor_stand,tag=TeleportLocation]
