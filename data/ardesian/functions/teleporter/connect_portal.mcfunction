# @e[tag=zPortal,tag=!PortalLocationSet]

# port key = @e[dx=0.8,dy=3,dz=0.8,nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}]

execute as @s run data modify entity @s ArmorItems[3] set from entity @e[nbt={ Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}, sort=nearest, limit=1] Item
kill @e[nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}, sort=nearest, limit=1]

tag @e[tag=zPortal,distance=..2,sort=nearest,limit=1] add PortalLocationSet
