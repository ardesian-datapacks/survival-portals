# @s[tag=PortalLocationSet,tag=PrimedPortal] with @e[distance=..1]

execute at @s run tag @e[distance=..1,type=!minecraft:item,type=!minecraft:item_display,type=!minecraft:armor_stand] add TeleportingEntity
execute as @e[tag=TeleportingEntity] run say TeleportingEntity
tag @s remove PrimedPortal
tag @s add TeleportSource

# *poof* away
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
particle minecraft:flash{color:[1,1,1,1]} ~ ~0.5 ~
particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

# Summon teleporting stand
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"],NoGravity:1b,Invisible:1b,Marker:1b}
execute as @e[tag=TeleportLocation] run function ardesian:teleporter/teleport

# Cleanup
tag @e remove TeleportSource
tag @e remove TeleportingEntity
kill @e[tag=TeleportLocation]
