# as @s[tag=PortalLocationSet,tag=PrimedPortal]

execute at @s run \
  tag @e[distance=..1,type=!minecraft:item,type=!minecraft:item_display,type=!minecraft:armor_stand] \
    add TeleportingEntity
execute at @s run \
  tag @e[tag=PortKeyDisplay,distance=..4,limit=1,sort=nearest] \
    add TeleportSource
tag @s remove PrimedPortal

execute as @e[tag=TeleportSource] run say --summoning--
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"]}

execute as @e[tag=TeleportSource] run say --teleporting--
execute as @e[type=minecraft:armor_stand,tag=TeleportLocation,limit=1,sort=nearest,distance=..2] run \
  execute at @s run function ardesian:teleporter/teleport

# Cleanup
tag @s remove TeleportSource
tag @e remove TeleportingEntity
kill @e[tag=TeleportLocation]
