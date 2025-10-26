# as @s[tag=PortalLocationSet,tag=PrimedPortal]

execute at @s positioned ~-0.5 ~-1 ~-0.5 run \
  tag @e[dx=0,dz=0,dy=3,type=!minecraft:item,type=!minecraft:item_display,type=!minecraft:armor_stand] \
    add TeleportingEntity
execute at @s run \
  tag @e[tag=PortKeyDisplay,distance=..3,limit=1,sort=nearest] \
    add TeleportSource
tag @s remove PrimedPortal

execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["TeleportLocation"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b}

execute as @e[type=minecraft:armor_stand,tag=TeleportLocation,limit=1,sort=nearest,distance=..3] run \
  execute at @s run function ardesian:teleporter/teleport
