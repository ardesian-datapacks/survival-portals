# @e[type=minecraft:armor_stand,tag=zPortal,tag=!PortalLocationSet]

# The port key item is stored on the portal stand's head slot.
execute as @s run data modify entity @s equipment.head set from entity @e[type=minecraft:item, distance=..2, nbt={Item:{id:"minecraft:ender_eye", components:{"minecraft:custom_data":{PortKey:1b}}}}, sort=nearest, limit=1] Item
kill @e[type=minecraft:item, distance=..2, nbt={Item:{id:"minecraft:ender_eye", components:{"minecraft:custom_data":{PortKey:1b}}}}, sort=nearest, limit=1]

tag @e[type=minecraft:armor_stand,tag=zPortal,distance=..2,sort=nearest,limit=1] add PortalLocationSet
