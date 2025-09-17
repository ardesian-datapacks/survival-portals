# @e[type=item,nbt={Item:{id:"minecraft:ender_eye",tag:{PortKey:1b}}}]

execute at @s run kill @e[sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}]
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags: ["QuickPort", "PrimedPortal"],Small:1b,Invulnerable:1b,PersistenceRequired:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute as @e[tag=QuickPort,sort=nearest,limit=1] run data modify entity @s ArmorItems[3] set from entity @e[nbt={Item:{id:"minecraft:ender_eye",tag:{PortKey:1b}}},sort=nearest,limit=1] Item
execute as @e[tag=QuickPort,sort=nearest,limit=1] run function ardesian:teleporter/align_portal

kill @s
