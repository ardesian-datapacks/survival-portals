# @e[type=minecraft:armor_stand,tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal]

execute at @s run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.1 3
kill @e[type=minecraft:item,distance=..2,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}]
tag @s add PrimedPortal
